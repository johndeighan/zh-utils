# zh-utils.test.coffee

import {utest} from '@jdeighan/base-utils/utest'
import {isZhChar, isPinyinChar} from '@jdeighan/zh-utils'

utest.truthy 6, isZhChar('你')
utest.falsy  7, isZhChar('a')
utest.truthy 8, isPinyinChar('ē')
utest.falsy  9, isPinyinChar('%')
