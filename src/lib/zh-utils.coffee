# zh-utils.coffee

import {
	undef, defined, notdefined, OL, getOptions,
	isString, isArray, isInteger,
	} from '@jdeighan/base-utils'
import {dbg, dbgEnter, dbgReturn} from '@jdeighan/base-utils/debug'
import {assert} from '@jdeighan/base-utils/exceptions'
import {eachCharInString} from '@jdeighan/base-utils'

# ---------------------------------------------------------------------------

export isZhChar = (ch) ->

	if ch.match(/[\u4E00-\u9FFF]/)
		return true
	else
		return false

# ---------------------------------------------------------------------------

export isPinyinChar = (ch) ->

	if ch.match(/[a-z 'āáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜ]/)
		return true
	else
		return false

# ---------------------------------------------------------------------------

export splitPinyin = (str) =>

	return str.split(/\s+|\'/)

# ---------------------------------------------------------------------------

export splitChinese = (str) =>

	dbgEnter 'splitChinese', str
	assert defined(lMatches = str.match(/^(\S+)\s+(.*)$/)),
			"Bad zh word: '#{str}'"
	[_, zh, pinyin] = lMatches
	assert eachCharInString(zh, isZhChar), \
			"Non-Chinese char in '#{zh}'"

	lPinyin = splitPinyin(pinyin)
	nPinyin = lPinyin.length
	nChars = zh.length

	assert (nPinyin == nChars), "Bad pinyin in '#{str}'"

	result = [zh, pinyin]
	dbgReturn 'splitChinese', result
	return result

# ---------------------------------------------------------------------------
# --- Should handle lines in:
#        test.zh
#        keepers.zh
#        nouns.zh, etc.

line2hWord = (line) ->

	if notdefined(line) || (line.length == 0)
		return undef
	else if lMatches = line.match(///^
			(?:         # optional empty checkbox
				□
				\s+
				)?
			(?:
				(\**)      # some number of * chars
				\s+
				)?
			([\u4E00-\u9FFF]+)  # Chinese characters
			([a-z\s'āáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜ]+)
			\-
			(.*)
			$///)
		[_, ast, zhWord, pinWord, enWord] = lMatches
		if notdefined(ast)
			ast = ''
		return
			numAst: ast.length
			zh:     zhWord.trim()
			en:     enWord.trim()
			pinyin: pinWord.trim()
	else
		croak "Bad line: '#{line}'"

# ---------------------------------------------------------------------------

export getKeepers = () ->

	lWords = []
	fp = new FileProcessor('./words/nouns.zh', {debug: true})
	fp.handleLine = (line, lineNum, hFileInfo) ->
		console.log line2hWord(line)
	fp.procAll()
#	random.shuffle(lWords)
	return lWords

