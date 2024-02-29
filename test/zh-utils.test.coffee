# zh-utils.test.coffee

import {equal, truthy, falsy} from '@jdeighan/base-utils/utest'
import {isZhChars, isPinyinChars} from '@jdeighan/zh-utils'

truthy isZhChars('你')
falsy  isZhChars('a')
truthy isPinyinChars('ē')
falsy  isPinyinChars('%')

truthy isZhChars('你好')
falsy  isZhChars('a你')
truthy isPinyinChars('hē')
falsy  isPinyinChars('ē%')
