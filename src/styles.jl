export
    NORMAL,
    TONE,
    TONE2,
    INITIALS,
    FIRST_LETTER,
    FINALS,
    FINALS_TONE,
    FINALS_TONE2,
    TONE3,
    FINALS_TONE3,
    BOPOMOFO,
    BOPOMOFO_FIRST,
    CYRILLIC,
    CYRILLIC_FIRST


export
    TONE12345,
    TONEONTOP,
    TONELESS

const NORMAL         = 0    # 中国 -> zhong guo     ⤎ 不带声调
const TONE           = 1    # 中国 -> zhōng guó     ⤎ 标准声调
const TONE2          = 2    # 中国 -> zho1ng guo2   ⤎ 声调在韵母后
const INITIALS       = 3    # 中国 -> zh g          ⤎ 只返回声母
const FIRST_LETTER   = 4    # 中国 -> z g           ⤎ 只返回拼音首字母
const FINALS         = 5    # 中国 -> ong uo        ⤎ 只返回韵母部分,不带声调
const FINALS_TONE    = 6    # 中国 -> ōng uó        ⤎ 只返回带标准声调的韵母
const FINALS_TONE2   = 7    # 中国 -> o1ng uo2      ⤎ 只返回带数字声调的韵母
const TONE3          = 8    # 中国 -> zhong1 guo2   ⤎ 数字声调在拼音末尾
const FINALS_TONE3   = 9    # 中国 -> ong1 uo2      ⤎ 只返回带数字声调的韵母,声调在末尾
const BOPOMOFO       = 10   # 中国 -> ㄓㄨㄥ ㄍㄨㄛˊ ⤎ 注音风格,带声调,第一声不标
const BOPOMOFO_FIRST = 11   # 中国 -> ㄓ ㄍ         ⤎ 仅首字母注音
const CYRILLIC       = 12   # 中国 -> чжун1 го2    ⤎ 俄语字母风格,数字声调在末尾
const CYRILLIC_FIRST = 13   # 中国 -> ч г          ⤎ 俄语字母风格,仅首字母


# most popular ones
TONE12345 = TONE3  # ni1 hao3 style, having 1 to 5 as five tones
TONEONTOP = TONE   # ní hǎo   style, having tone on top of vowel
TONELESS  = NORMAL # ni hao   style, having no tones
