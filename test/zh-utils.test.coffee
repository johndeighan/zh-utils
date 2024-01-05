# zh-utils.test.coffee

import {utest} from '@jdeighan/base-utils/utest'
import {isZhChars, isPinyinChars} from '@jdeighan/zh-utils'

utest.truthy 6, isZhChars('你')
utest.falsy  7, isZhChars('a')
utest.truthy 8, isPinyinChars('ē')
utest.falsy  9, isPinyinChars('%')

utest.truthy 11, isZhChars('你好')
utest.falsy  12, isZhChars('a你')
utest.truthy 13, isPinyinChars('hē')
utest.falsy  14, isPinyinChars('ē%')
