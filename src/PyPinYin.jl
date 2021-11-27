"""
`PyPinYin` package to interface with Python's `pypinyin` through `PyCall`.
On loading, three functions are provided as generic functions:
    + pinyin
    + lazypinyin
    + hanzi2pinyin
To find documentation for those functions, one should go into
Julia's `?` REPL mode. README.md also provides many examples.
"""
module PyPinYin

include("./styles.jl")

export pinyin
export lazypinyin
export printpinyin
export hanzi2pinyin

using PyCall


function __init__()
    py"""
    from pypinyin import lazy_pinyin as lazypy
    from pypinyin import pinyin as pinyins
    """
end


"""
    lazypinyin(hanzi::AbstractString;    # 汉字串
               style::Int=NORMAL,        # 声调风格
               errors::String="default", # 如何处理没有拼音的字符(default/ignore/replace)
               strict::Bool=true,        # 是否严格遵照《汉语拼音方案》处理声母和韵母
               v2u::Bool=false,          # 是否用 `ü` 代替 `v`
               tone5::Bool=false,        # 是否用 5 标识轻声
               sandhi::Bool=false)       # 是否变调，nǐ hǎo -> ní hǎo
"""
function lazypinyin(hanzi::AbstractString;
                    style::Int=NORMAL,
                    errors::String="default",
                    strict::Bool=true,
                    v2u::Bool=false,
                    tone5::Bool=false,
                    sandhi::Bool=false)

    return py"lazypy"(hanzi,
                      style=style,
                      errors=errors,
                      strict=strict,
                      v_to_u=v2u,
                      neutral_tone_with_five=tone5,
                      tone_sandhi=sandhi)
end


"""
    pinyin(hanzi::AbstractString;   # 汉字串
           style::Int=TONE,         # 声调风格
           heteronym::Bool=false,   # 多音字
           errors::String="default" # 如何处理没有拼音的字符(default/ignore/replace)
           strict::Bool=true,       # 是否严格遵照《汉语拼音方案》处理声母和韵母
           v2u::Bool=false,         # 是否用 `ü` 代替 `v`
           tone5::Bool=false)       # 是否用 5 标识轻声
"""
function pinyin(hanzi::AbstractString;
                style::Int=TONE,
                heteronym::Bool=false,
                errors::String="default",
                strict::Bool=true,
                v2u::Bool=false,
                tone5::Bool=false)

    return py"pinyins"(hanzi,
                       style=style,
                       heteronym=heteronym,
                       errors=errors,
                       strict=strict,
                       v_to_u=v2u,
                       neutral_tone_with_five=tone5)
end


"""
    printpinyin(pinyins)
将汉字转拼音的结果输出到一行并以空格分开
"""
function printpinyin(pinyins)
    n = length(pinyins)
    for i = 1:n-1
        print("$(pinyins[i]) ")
    end
    print(pinyins[n])
end


"""
    hanzi2pinyin(hanzi::AbstractString) = lazypinyin(hanzi, style=TONEONTOP, v2u=true, sandhi=true)
常见转拼音需求的快捷函数
# Example
julia> hanzi2pinyin("你好啊Julia，战略！") |> printpinyin
ní hǎo a Julia， zhàn lüè ！
"""
function hanzi2pinyin(hanzi::AbstractString)
    return lazypinyin(hanzi, style=TONEONTOP, v2u=true, sandhi=true)
end

end # module
