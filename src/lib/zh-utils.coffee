# zh-utils.coffee

import {
	undef, defined, notdefined, OL, getOptions,
	isString, isArray, isInteger,
	} from '@jdeighan/base-utils'
import {dbg, dbgEnter, dbgReturn} from '@jdeighan/base-utils/debug'
import {assert} from '@jdeighan/base-utils/exceptions'
import {eachCharInString} from '@jdeighan/base-utils'

# ---------------------------------------------------------------------------

export isZhChars = (str) ->

	for ch in [str...]
		if ! ch.match(/[\u4E00-\u9FFF]/)
			return false
	return true
	
# ---------------------------------------------------------------------------

export isPinyinChars = (str) ->

	for ch in [str...]
		if ! ch.match(/[a-z 'āáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜ]/)
			return false
	return true
