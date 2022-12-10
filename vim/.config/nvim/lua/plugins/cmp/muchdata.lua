<1>{
  cache = {
    entries = {
      ["get_default_insert_range:27"] = <2>{
        ["end"] = {
          character = 0,
          line = 64
        },
        start = {
          character = 0,
          line = 64
        }
      },
      ["get_default_replace_range:27"] = <3>{
        ["end"] = {
          character = 0,
          line = 64
        },
        start = {
          character = 1,
          line = 64
        }
      },
      ["get_entries:28:"] = { <4>{
          cache = {
            entries = {
              get_completion_item = <5>{
                insertText = "do\n\t$0\nend",
                insertTextFormat = 2,
                kind = 15,
                label = "do .. end",
                sortText = "0001"
              },
              get_filter_text = "do .. end",
              get_insert_text = "do\n\t$0\nend",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "do .. end~",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "do"
              },
              get_word = "do"
            },
            <metatable> = {
              __index = <6>{
                clear = <function 1>,
                ensure = <function 2>,
                get = <function 3>,
                key = <function 4>,
                new = <function 5>,
                set = <function 6>
              }
            }
          },
          completion_item = <table 5>,
          confirmed = false,
          context = <7>{
            bufnr = 2,
            cache = {
              entries = {
                ["get_offset:\\%(-\\?\\d\\+\\%(\\.\\d\\+\\)\\?\\|\\h\\%(\\w\\|á\\|Á\\|é\\|É\\|í\\|Í\\|ó\\|Ó\\|ú\\|Ú\\)*\\%(-\\%(\\w\\|á\\|Á\\|é\\|É\\|í\\|Í\\|ó\\|Ó\\|ú\\|Ú\\)*\\)*\\):"] = 1,
                ["get_offset:\\%(-\\?\\d\\+\\%(\\.\\d\\+\\)\\?\\|\\h\\w*\\%(-\\w*\\)*\\):"] = 1,
                ["get_offset:\\%([^/\\\\:\\*?<>'\"`\\|]\\)*:"] = 1,
                ["get_offset:\\%([^[:alnum:][:blank:]]\\|\\w\\+\\):"] = 1,
                ["get_offset:\\%(\\V(\\m\\|\\V,\\m\\|\\V \\m\\)\\s*\\zs:"] = 1
              },
              <metatable> = {
                __index = <table 6>
              }
            },
            cursor = {
              character = 0,
              col = 1,
              line = 64,
              row = 65
            },
            cursor_after_line = "",
            cursor_before_line = "",
            cursor_line = "",
            filetype = "lua",
            id = 781,
            option = {
              reason = "manual"
            },
            prev_context = {
              bufnr = 2,
              cursor = {
                character = 0,
                col = 1,
                line = 64,
                row = 65
              },
              cursor_after_line = "",
              cursor_before_line = "",
              cursor_line = "",
              filetype = "lua",
              id = 780,
              option = {},
              time = 942271
            },
            time = 942593,
            <metatable> = {
              __index = {
                changed = <function 7>,
                clone = <function 8>,
                empty = <function 9>,
                get_offset = <function 10>,
                get_reason = <function 11>,
                new = <function 12>
              }
            }
          },
          exact = false,
          id = 40380,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <8>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 8>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <9>{
              convert_position_encoding = <function 13>,
              execute = <function 14>,
              fill_defaults = <function 15>,
              get_commit_characters = <function 16>,
              get_completion_item = <function 17>,
              get_documentation = <function 18>,
              get_filter_text = <function 19>,
              get_insert_range = <function 20>,
              get_insert_text = <function 21>,
              get_kind = <function 22>,
              get_offset = <function 23>,
              get_overwrite = <function 24>,
              get_replace_range = <function 25>,
              get_view = <function 26>,
              get_vim_item = <function 27>,
              get_word = <function 28>,
              is_deprecated = <function 29>,
              match = <function 30>,
              new = <function 31>,
              resolve = <function 32>
            }
          }
        }, <10>{
          cache = {
            entries = {
              get_completion_item = <11>{
                insertTextFormat = 2,
                kind = 14,
                label = "and",
                sortText = "0002"
              },
              get_filter_text = "and",
              get_insert_text = "and",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "and",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "and"
              },
              get_word = "and"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 11>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40381,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <12>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 12>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <13>{
          cache = {
            entries = {
              get_completion_item = <14>{
                insertTextFormat = 2,
                kind = 14,
                label = "break",
                sortText = "0003"
              },
              get_filter_text = "break",
              get_insert_text = "break",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "break",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "break"
              },
              get_word = "break"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 14>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40382,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <15>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 15>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <16>{
          cache = {
            entries = {
              get_completion_item = <17>{
                insertTextFormat = 2,
                kind = 14,
                label = "else",
                sortText = "0004"
              },
              get_filter_text = "else",
              get_insert_text = "else",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "else",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "else"
              },
              get_word = "else"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 17>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40383,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <18>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 18>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <19>{
          cache = {
            entries = {
              get_completion_item = <20>{
                insertText = "elseif $1 then",
                insertTextFormat = 2,
                kind = 15,
                label = "elseif .. then",
                sortText = "0005"
              },
              get_filter_text = "elseif .. then",
              get_insert_text = "elseif $1 then",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "elseif .. then~",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "elseif"
              },
              get_word = "elseif"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 20>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40384,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <21>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 21>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <22>{
          cache = {
            entries = {
              get_completion_item = <23>{
                insertTextFormat = 2,
                kind = 14,
                label = "end",
                sortText = "0006"
              },
              get_filter_text = "end",
              get_insert_text = "end",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "end",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "end"
              },
              get_word = "end"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 23>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40385,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <24>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 24>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <25>{
          cache = {
            entries = {
              get_completion_item = <26>{
                insertTextFormat = 2,
                kind = 14,
                label = "false",
                sortText = "0007"
              },
              get_filter_text = "false",
              get_insert_text = "false",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "false",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "false"
              },
              get_word = "false"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 26>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40386,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <27>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 27>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <28>{
          cache = {
            entries = {
              get_completion_item = <29>{
                insertText = "for ${1:index}, ${2:value} in ipairs(${3:t}) do\n\t$0\nend",
                insertTextFormat = 2,
                kind = 15,
                label = "for .. ipairs",
                sortText = "0008"
              },
              get_filter_text = "for .. ipairs",
              get_insert_text = "for ${1:index}, ${2:value} in ipairs(${3:t}) do\n\t$0\nend",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "for .. ipairs~",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "for"
              },
              get_word = "for"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 29>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40387,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <30>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 30>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <31>{
          cache = {
            entries = {
              get_completion_item = <32>{
                insertText = "for ${1:key}, ${2:value} in pairs(${3:t}) do\n\t$0\nend",
                insertTextFormat = 2,
                kind = 15,
                label = "for .. pairs",
                sortText = "0009"
              },
              get_filter_text = "for .. pairs",
              get_insert_text = "for ${1:key}, ${2:value} in pairs(${3:t}) do\n\t$0\nend",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "for .. pairs~",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "for"
              },
              get_word = "for"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 32>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40388,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <33>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 33>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <34>{
          cache = {
            entries = {
              get_completion_item = <35>{
                insertText = "for ${1:i} = ${2:1}, ${3:10, 1} do\n\t$0\nend",
                insertTextFormat = 2,
                kind = 15,
                label = "for i = ..",
                sortText = "0010"
              },
              get_filter_text = "for i = ..",
              get_insert_text = "for ${1:i} = ${2:1}, ${3:10, 1} do\n\t$0\nend",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "for i = ..~",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "for"
              },
              get_word = "for"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 35>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40389,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <36>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 36>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <37>{
          cache = {
            entries = {
              get_completion_item = <38>{
                insertText = "function $1($2)\n\t$0\nend",
                insertTextFormat = 2,
                kind = 15,
                label = "function ()",
                sortText = "0011"
              },
              get_filter_text = "function ()",
              get_insert_text = "function $1($2)\n\t$0\nend",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "function ()~",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "function"
              },
              get_word = "function"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 38>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40390,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <39>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 39>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <40>{
          cache = {
            entries = {
              get_completion_item = <41>{
                insertTextFormat = 2,
                kind = 14,
                label = "goto",
                sortText = "0012"
              },
              get_filter_text = "goto",
              get_insert_text = "goto",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "goto",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "goto"
              },
              get_word = "goto"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 41>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40391,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <42>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 42>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <43>{
          cache = {
            entries = {
              get_completion_item = <44>{
                insertText = "if $1 then\n\t$0\nend",
                insertTextFormat = 2,
                kind = 15,
                label = "if .. then",
                sortText = "0013"
              },
              get_filter_text = "if .. then",
              get_insert_text = "if $1 then\n\t$0\nend",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "if .. then~",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "if"
              },
              get_word = "if"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 44>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40392,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <45>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 45>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <46>{
          cache = {
            entries = {
              get_completion_item = <47>{
                insertText = "in ${1:pairs(${2:t})} do\n\t$0\nend",
                insertTextFormat = 2,
                kind = 15,
                label = "in ..",
                sortText = "0014"
              },
              get_filter_text = "in ..",
              get_insert_text = "in ${1:pairs(${2:t})} do\n\t$0\nend",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "in ..~",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "in"
              },
              get_word = "in"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 47>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40393,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <48>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 48>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <49>{
          cache = {
            entries = {
              get_completion_item = <50>{
                insertTextFormat = 2,
                kind = 14,
                label = "local",
                sortText = "0015"
              },
              get_filter_text = "local",
              get_insert_text = "local",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "local",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "local"
              },
              get_word = "local"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 50>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40394,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <51>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 51>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <52>{
          cache = {
            entries = {
              get_completion_item = <53>{
                insertText = "local function $1($2)\n\t$0\nend",
                insertTextFormat = 2,
                kind = 15,
                label = "local function",
                sortText = "0016"
              },
              get_filter_text = "local function",
              get_insert_text = "local function $1($2)\n\t$0\nend",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "local function~",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "local"
              },
              get_word = "local"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 53>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40395,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <54>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 54>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <55>{
          cache = {
            entries = {
              get_completion_item = <56>{
                insertTextFormat = 2,
                kind = 14,
                label = "nil",
                sortText = "0017"
              },
              get_filter_text = "nil",
              get_insert_text = "nil",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "nil",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "nil"
              },
              get_word = "nil"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 56>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40396,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <57>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 57>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <58>{
          cache = {
            entries = {
              get_completion_item = <59>{
                insertTextFormat = 2,
                kind = 14,
                label = "not",
                sortText = "0018"
              },
              get_filter_text = "not",
              get_insert_text = "not",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "not",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "not"
              },
              get_word = "not"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 59>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40397,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <60>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 60>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <61>{
          cache = {
            entries = {
              get_completion_item = <62>{
                insertTextFormat = 2,
                kind = 14,
                label = "or",
                sortText = "0019"
              },
              get_filter_text = "or",
              get_insert_text = "or",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "or",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "or"
              },
              get_word = "or"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 62>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40398,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <63>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 63>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <64>{
          cache = {
            entries = {
              get_completion_item = <65>{
                insertText = "repeat\n\t$0\nuntil $1",
                insertTextFormat = 2,
                kind = 15,
                label = "repeat .. until",
                sortText = "0020"
              },
              get_filter_text = "repeat .. until",
              get_insert_text = "repeat\n\t$0\nuntil $1",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "repeat .. until~",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "repeat"
              },
              get_word = "repeat"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 65>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40399,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <66>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 66>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <67>{
          cache = {
            entries = {
              get_completion_item = <68>{
                insertTextFormat = 2,
                kind = 14,
                label = "return",
                sortText = "0021"
              },
              get_filter_text = "return",
              get_insert_text = "return",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "return",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "return"
              },
              get_word = "return"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 68>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40400,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <69>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 69>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <70>{
          cache = {
            entries = {
              get_completion_item = <71>{
                insertText = "do return $1end",
                insertTextFormat = 2,
                kind = 15,
                label = "do return end",
                sortText = "0022"
              },
              get_filter_text = "do return end",
              get_insert_text = "do return $1end",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "do return end~",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "do"
              },
              get_word = "do"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 71>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40401,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <72>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 72>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <73>{
          cache = {
            entries = {
              get_completion_item = <74>{
                insertText = "then\n\t$0\nend",
                insertTextFormat = 2,
                kind = 15,
                label = "then .. end",
                sortText = "0023"
              },
              get_filter_text = "then .. end",
              get_insert_text = "then\n\t$0\nend",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "then .. end~",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "then"
              },
              get_word = "then"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 74>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40402,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <75>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 75>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <76>{
          cache = {
            entries = {
              get_completion_item = <77>{
                insertTextFormat = 2,
                kind = 14,
                label = "true",
                sortText = "0024"
              },
              get_filter_text = "true",
              get_insert_text = "true",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "true",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "true"
              },
              get_word = "true"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 77>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40403,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <78>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 78>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <79>{
          cache = {
            entries = {
              get_completion_item = <80>{
                insertTextFormat = 2,
                kind = 14,
                label = "until",
                sortText = "0025"
              },
              get_filter_text = "until",
              get_insert_text = "until",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "until",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "until"
              },
              get_word = "until"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 80>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40404,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <81>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 81>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <82>{
          cache = {
            entries = {
              get_completion_item = <83>{
                insertText = "while ${1:true} do\n\t$0\nend",
                insertTextFormat = 2,
                kind = 15,
                label = "while .. do",
                sortText = "0026"
              },
              get_filter_text = "while .. do",
              get_insert_text = "while ${1:true} do\n\t$0\nend",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "while .. do~",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "while"
              },
              get_word = "while"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 83>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40405,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <84>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 84>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <85>{
          cache = {
            entries = {
              get_completion_item = <86>{
                data = {
                  id = 1635,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "blur_amount",
                sortText = "0027"
              },
              get_filter_text = "blur_amount",
              get_insert_text = "blur_amount",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "blur_amount",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "blur_amount"
              },
              get_word = "blur_amount"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 86>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40406,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <87>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 87>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <88>{
          cache = {
            entries = {
              get_completion_item = <89>{
                data = {
                  id = 1636,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "blur_on_kde",
                insertTextFormat = 2,
                kind = 3,
                label = "blur_on_kde()",
                sortText = "0028"
              },
              get_filter_text = "blur_on_kde()",
              get_insert_text = "blur_on_kde",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "blur_on_kde()",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "blur_on_kde"
              },
              get_word = "blur_on_kde"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 89>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40407,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <90>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 90>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <91>{
          cache = {
            entries = {
              get_completion_item = <92>{
                data = {
                  id = 1637,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "chromebook",
                insertTextFormat = 2,
                kind = 3,
                label = "chromebook()",
                sortText = "0029"
              },
              get_filter_text = "chromebook()",
              get_insert_text = "chromebook",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "chromebook()",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "chromebook"
              },
              get_word = "chromebook"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 92>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40408,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <93>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 93>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <94>{
          cache = {
            entries = {
              get_completion_item = <95>{
                data = {
                  id = 1638,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "g",
                sortText = "0030"
              },
              get_filter_text = "g",
              get_insert_text = "g",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "g",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "g"
              },
              get_word = "g"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 95>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40409,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <96>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 96>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <97>{
          cache = {
            entries = {
              get_completion_item = <98>{
                data = {
                  id = 1639,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "go",
                sortText = "0031"
              },
              get_filter_text = "go",
              get_insert_text = "go",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "go",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "go"
              },
              get_word = "go"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 98>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40410,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <99>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 99>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <100>{
          cache = {
            entries = {
              get_completion_item = <101>{
                data = {
                  id = 1640,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "manjaro",
                insertTextFormat = 2,
                kind = 3,
                label = "manjaro()",
                sortText = "0032"
              },
              get_filter_text = "manjaro()",
              get_insert_text = "manjaro",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "manjaro()",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "manjaro"
              },
              get_word = "manjaro"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 101>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40411,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <102>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 102>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <103>{
          cache = {
            entries = {
              get_completion_item = <104>{
                data = {
                  id = 1641,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "A",
                insertTextFormat = 2,
                kind = 3,
                label = "A(...)",
                sortText = "0033"
              },
              get_filter_text = "A(...)",
              get_insert_text = "A",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "A(...)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "A"
              },
              get_word = "A"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 104>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40412,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <105>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 105>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <106>{
          cache = {
            entries = {
              get_completion_item = <107>{
                data = {
                  id = 1642,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 13,
                label = "Account",
                sortText = "0034"
              },
              get_filter_text = "Account",
              get_insert_text = "Account",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "Account",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "Account"
              },
              get_word = "Account"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 107>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40413,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <108>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 108>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <109>{
          cache = {
            entries = {
              get_completion_item = <110>{
                data = {
                  id = 1643,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 13,
                label = "Author",
                sortText = "0035"
              },
              get_filter_text = "Author",
              get_insert_text = "Author",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "Author",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "Author"
              },
              get_word = "Author"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 110>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40414,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <111>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 111>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <112>{
          cache = {
            entries = {
              get_completion_item = <113>{
                data = {
                  id = 1644,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "BindFeedkeys",
                insertTextFormat = 2,
                kind = 3,
                label = "BindFeedkeys(key)",
                sortText = "0036"
              },
              get_filter_text = "BindFeedkeys(key)",
              get_insert_text = "BindFeedkeys",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "BindFeedkeys(key)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "BindFeedkeys"
              },
              get_word = "BindFeedkeys"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 113>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40415,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <114>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 114>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <115>{
          cache = {
            entries = {
              get_completion_item = <116>{
                data = {
                  id = 1645,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "BuffersOpened",
                insertTextFormat = 2,
                kind = 3,
                label = "BuffersOpened()",
                sortText = "0037"
              },
              get_filter_text = "BuffersOpened()",
              get_insert_text = "BuffersOpened",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "BuffersOpened()",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "BuffersOpened"
              },
              get_word = "BuffersOpened"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 116>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40416,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <117>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 117>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <118>{
          cache = {
            entries = {
              get_completion_item = <119>{
                data = {
                  id = 1646,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "CMD",
                insertTextFormat = 2,
                kind = 3,
                label = "CMD(command)",
                sortText = "0038"
              },
              get_filter_text = "CMD(command)",
              get_insert_text = "CMD",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "CMD(command)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "CMD"
              },
              get_word = "CMD"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 119>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40417,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <120>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 120>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <121>{
          cache = {
            entries = {
              get_completion_item = <122>{
                data = {
                  id = 1647,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 13,
                label = "COMPLETED",
                sortText = "0039"
              },
              get_filter_text = "COMPLETED",
              get_insert_text = "COMPLETED",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "COMPLETED",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "COMPLETED"
              },
              get_word = "COMPLETED"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 122>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40418,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <123>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 123>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <124>{
          cache = {
            entries = {
              get_completion_item = <125>{
                data = {
                  id = 1648,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "CanDoTopWin",
                insertTextFormat = 2,
                kind = 3,
                label = "CanDoTopWin()",
                sortText = "0040"
              },
              get_filter_text = "CanDoTopWin()",
              get_insert_text = "CanDoTopWin",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "CanDoTopWin()",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "CanDoTopWin"
              },
              get_word = "CanDoTopWin"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 125>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40419,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <126>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 126>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <127>{
          cache = {
            entries = {
              get_completion_item = <128>{
                data = {
                  id = 1649,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "CanMakeBorders",
                insertTextFormat = 2,
                kind = 3,
                label = "CanMakeBorders()",
                sortText = "0041"
              },
              get_filter_text = "CanMakeBorders()",
              get_insert_text = "CanMakeBorders",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "CanMakeBorders()",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "CanMakeBorders"
              },
              get_word = "CanMakeBorders"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 128>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40420,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <129>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 129>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <130>{
          cache = {
            entries = {
              get_completion_item = <131>{
                data = {
                  id = 1650,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "CanWinBeHidden",
                insertTextFormat = 2,
                kind = 3,
                label = "CanWinBeHidden()",
                sortText = "0042"
              },
              get_filter_text = "CanWinBeHidden()",
              get_insert_text = "CanWinBeHidden",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "CanWinBeHidden()",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "CanWinBeHidden"
              },
              get_word = "CanWinBeHidden"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 131>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40421,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <132>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 132>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <133>{
          cache = {
            entries = {
              get_completion_item = <134>{
                data = {
                  id = 1651,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "CanWinBeReordered",
                insertTextFormat = 2,
                kind = 3,
                label = "CanWinBeReordered()",
                sortText = "0043"
              },
              get_filter_text = "CanWinBeReordered()",
              get_insert_text = "CanWinBeReordered",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "CanWinBeReordered()",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "CanWinBeReordered"
              },
              get_word = "CanWinBeReordered"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 134>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40422,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <135>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 135>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <136>{
          cache = {
            entries = {
              get_completion_item = <137>{
                data = {
                  id = 1652,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "CloseHiddenBuffers",
                insertTextFormat = 2,
                kind = 3,
                label = "CloseHiddenBuffers()",
                sortText = "0044"
              },
              get_filter_text = "CloseHiddenBuffers()",
              get_insert_text = "CloseHiddenBuffers",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "CloseHiddenBuffers()",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "CloseHiddenBuffers"
              },
              get_word = "CloseHiddenBuffers"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 137>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40423,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <138>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 138>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <139>{
          cache = {
            entries = {
              get_completion_item = <140>{
                data = {
                  id = 1653,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "ColorTheme",
                sortText = "0045"
              },
              get_filter_text = "ColorTheme",
              get_insert_text = "ColorTheme",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "ColorTheme",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "ColorTheme"
              },
              get_word = "ColorTheme"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 140>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40424,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <141>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 141>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <142>{
          cache = {
            entries = {
              get_completion_item = <143>{
                data = {
                  id = 1654,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "Counter",
                sortText = "0046"
              },
              get_filter_text = "Counter",
              get_insert_text = "Counter",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "Counter",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "Counter"
              },
              get_word = "Counter"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 143>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40425,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <144>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 144>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <145>{
          cache = {
            entries = {
              get_completion_item = <146>{
                data = {
                  id = 1655,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "Create_wiki",
                insertTextFormat = 2,
                kind = 3,
                label = "Create_wiki(name)",
                sortText = "0047"
              },
              get_filter_text = "Create_wiki(name)",
              get_insert_text = "Create_wiki",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "Create_wiki(name)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "Create_wiki"
              },
              get_word = "Create_wiki"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 146>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40426,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <147>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 147>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <148>{
          cache = {
            entries = {
              get_completion_item = <149>{
                data = {
                  id = 1656,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "CurrentFloatWinId",
                sortText = "0048"
              },
              get_filter_text = "CurrentFloatWinId",
              get_insert_text = "CurrentFloatWinId",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "CurrentFloatWinId",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "CurrentFloatWinId"
              },
              get_word = "CurrentFloatWinId"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 149>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40427,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <150>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 150>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <151>{
          cache = {
            entries = {
              get_completion_item = <152>{
                data = {
                  id = 1657,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "Deque",
                sortText = "0049"
              },
              get_filter_text = "Deque",
              get_insert_text = "Deque",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "Deque",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "Deque"
              },
              get_word = "Deque"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 152>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40428,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <153>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 153>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <154>{
          cache = {
            entries = {
              get_completion_item = <155>{
                data = {
                  id = 1658,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "Exec",
                insertTextFormat = 2,
                kind = 3,
                label = "Exec(command)",
                sortText = "0050"
              },
              get_filter_text = "Exec(command)",
              get_insert_text = "Exec",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "Exec(command)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "Exec"
              },
              get_word = "Exec"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 155>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40429,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <156>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 156>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <157>{
          cache = {
            entries = {
              get_completion_item = <158>{
                data = {
                  id = 1659,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "ExecuteFunction",
                insertTextFormat = 2,
                kind = 3,
                label = "ExecuteFunction(name)",
                sortText = "0051"
              },
              get_filter_text = "ExecuteFunction(name)",
              get_insert_text = "ExecuteFunction",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "ExecuteFunction(name)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "ExecuteFunction"
              },
              get_word = "ExecuteFunction"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 158>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40430,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <159>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 159>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <160>{
          cache = {
            entries = {
              get_completion_item = <161>{
                data = {
                  id = 1660,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "FN",
                insertTextFormat = 2,
                kind = 3,
                label = "FN(f, ...)",
                sortText = "0052"
              },
              get_filter_text = "FN(f, ...)",
              get_insert_text = "FN",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "FN(f, ...)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "FN"
              },
              get_word = "FN"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 161>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40431,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <162>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 162>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <163>{
          cache = {
            entries = {
              get_completion_item = <164>{
                data = {
                  id = 1661,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "Feedkeys",
                insertTextFormat = 2,
                kind = 3,
                label = "Feedkeys(key, noremap)",
                sortText = "0053"
              },
              get_filter_text = "Feedkeys(key, noremap)",
              get_insert_text = "Feedkeys",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "Feedkeys(key, noremap)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "Feedkeys"
              },
              get_word = "Feedkeys"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 164>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40432,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <165>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 165>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <166>{
          cache = {
            entries = {
              get_completion_item = <167>{
                data = {
                  id = 1662,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "FlashCursor",
                insertTextFormat = 2,
                kind = 3,
                label = "FlashCursor(times, blink_time)",
                sortText = "0054"
              },
              get_filter_text = "FlashCursor(times, blink_time)",
              get_insert_text = "FlashCursor",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "FlashCursor(times, blink_time)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "FlashCursor"
              },
              get_word = "FlashCursor"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 167>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40433,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <168>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 168>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <169>{
          cache = {
            entries = {
              get_completion_item = <170>{
                data = {
                  id = 1663,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "FoldText",
                insertTextFormat = 2,
                kind = 3,
                label = "FoldText()",
                sortText = "0055"
              },
              get_filter_text = "FoldText()",
              get_insert_text = "FoldText",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "FoldText()",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "FoldText"
              },
              get_word = "FoldText"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 170>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40434,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <171>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 171>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <172>{
          cache = {
            entries = {
              get_completion_item = <173>{
                data = {
                  id = 1664,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "GetBestResult",
                sortText = "0056"
              },
              get_filter_text = "GetBestResult",
              get_insert_text = "GetBestResult",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "GetBestResult",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "GetBestResult"
              },
              get_word = "GetBestResult"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 173>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40435,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <174>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 174>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <175>{
          cache = {
            entries = {
              get_completion_item = <176>{
                data = {
                  id = 1665,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "GetFile",
                sortText = "0057"
              },
              get_filter_text = "GetFile",
              get_insert_text = "GetFile",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "GetFile",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "GetFile"
              },
              get_word = "GetFile"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 176>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40436,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <177>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 177>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <178>{
          cache = {
            entries = {
              get_completion_item = <179>{
                data = {
                  id = 1666,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "GetPrompt",
                sortText = "0058"
              },
              get_filter_text = "GetPrompt",
              get_insert_text = "GetPrompt",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "GetPrompt",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "GetPrompt"
              },
              get_word = "GetPrompt"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 179>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40437,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <180>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 180>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <181>{
          cache = {
            entries = {
              get_completion_item = <182>{
                data = {
                  id = 1667,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "GetResults",
                sortText = "0059"
              },
              get_filter_text = "GetResults",
              get_insert_text = "GetResults",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "GetResults",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "GetResults"
              },
              get_word = "GetResults"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 182>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40438,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <183>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 183>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <184>{
          cache = {
            entries = {
              get_completion_item = <185>{
                data = {
                  id = 1668,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "GetSelection",
                sortText = "0060"
              },
              get_filter_text = "GetSelection",
              get_insert_text = "GetSelection",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "GetSelection",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "GetSelection"
              },
              get_word = "GetSelection"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 185>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40439,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <186>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 186>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <187>{
          cache = {
            entries = {
              get_completion_item = <188>{
                data = {
                  id = 1669,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "GetSelectionValue",
                sortText = "0061"
              },
              get_filter_text = "GetSelectionValue",
              get_insert_text = "GetSelectionValue",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "GetSelectionValue",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "GetSelectionValue"
              },
              get_word = "GetSelectionValue"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 188>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40440,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <189>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 189>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <190>{
          cache = {
            entries = {
              get_completion_item = <191>{
                data = {
                  id = 1670,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "GitInfo",
                insertTextFormat = 2,
                kind = 3,
                label = "GitInfo()",
                sortText = "0062"
              },
              get_filter_text = "GitInfo()",
              get_insert_text = "GitInfo",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "GitInfo()",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "GitInfo"
              },
              get_word = "GitInfo"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 191>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40441,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <192>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 192>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <193>{
          cache = {
            entries = {
              get_completion_item = <194>{
                data = {
                  id = 1671,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "Group_bufferline_tabs",
                insertTextFormat = 2,
                kind = 3,
                label = "Group_bufferline_tabs()",
                sortText = "0063"
              },
              get_filter_text = "Group_bufferline_tabs()",
              get_insert_text = "Group_bufferline_tabs",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "Group_bufferline_tabs()",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "Group_bufferline_tabs"
              },
              get_word = "Group_bufferline_tabs"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 194>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40442,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <195>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 195>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <196>{
          cache = {
            entries = {
              get_completion_item = <197>{
                data = {
                  id = 1672,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "LOADED",
                insertTextFormat = 2,
                kind = 3,
                label = "LOADED(name)",
                sortText = "0064"
              },
              get_filter_text = "LOADED(name)",
              get_insert_text = "LOADED",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "LOADED(name)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "LOADED"
              },
              get_word = "LOADED"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 197>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40443,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <198>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 198>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <199>{
          cache = {
            entries = {
              get_completion_item = <200>{
                data = {
                  id = 1673,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "Logger",
                insertTextFormat = 2,
                kind = 3,
                label = "Logger(logger_name, should_print)",
                sortText = "0065"
              },
              get_filter_text = "Logger(logger_name, should_print)",
              get_insert_text = "Logger",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "Logger(logger_name, should_print)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "Logger"
              },
              get_word = "Logger"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 200>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40444,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <201>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 201>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <202>{
          cache = {
            entries = {
              get_completion_item = <203>{
                data = {
                  id = 1674,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "LspShowMessageBuffer",
                insertTextFormat = 2,
                kind = 3,
                label = "LspShowMessageBuffer()",
                sortText = "0066"
              },
              get_filter_text = "LspShowMessageBuffer()",
              get_insert_text = "LspShowMessageBuffer",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "LspShowMessageBuffer()",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "LspShowMessageBuffer"
              },
              get_word = "LspShowMessageBuffer"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 203>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40445,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <204>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 204>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <205>{
          cache = {
            entries = {
              get_completion_item = <206>{
                data = {
                  id = 1675,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "M",
                sortText = "0067"
              },
              get_filter_text = "M",
              get_insert_text = "M",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "M",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "M"
              },
              get_word = "M"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 206>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40446,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <207>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 207>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <208>{
          cache = {
            entries = {
              get_completion_item = <209>{
                data = {
                  id = 1676,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "Map",
                insertTextFormat = 2,
                kind = 3,
                label = "Map(opts, maps)",
                sortText = "0068"
              },
              get_filter_text = "Map(opts, maps)",
              get_insert_text = "Map",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "Map(opts, maps)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "Map"
              },
              get_word = "Map"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 209>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40447,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <210>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 210>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <211>{
          cache = {
            entries = {
              get_completion_item = <212>{
                data = {
                  id = 1677,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "Map2",
                insertTextFormat = 2,
                kind = 3,
                label = "Map2(mode, key_prefix, desc_prefix, maps, opts)",
                sortText = "0069"
              },
              get_filter_text = "Map2(mode, key_prefix, desc_prefix, maps, opts)",
              get_insert_text = "Map2",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "Map2(mode, key_prefix, desc_prefix, maps, opts)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "Map2"
              },
              get_word = "Map2"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 212>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40448,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <213>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 213>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <214>{
          cache = {
            entries = {
              get_completion_item = <215>{
                data = {
                  id = 1678,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "MatchCharacter",
                insertTextFormat = 2,
                kind = 3,
                label = "MatchCharacter()",
                sortText = "0070"
              },
              get_filter_text = "MatchCharacter()",
              get_insert_text = "MatchCharacter",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "MatchCharacter()",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "MatchCharacter"
              },
              get_word = "MatchCharacter"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 215>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40449,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <216>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 216>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <217>{
          cache = {
            entries = {
              get_completion_item = <218>{
                data = {
                  id = 1679,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "NVIM_CONFIG_PATH",
                sortText = "0071"
              },
              get_filter_text = "NVIM_CONFIG_PATH",
              get_insert_text = "NVIM_CONFIG_PATH",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "NVIM_CONFIG_PATH",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "NVIM_CONFIG_PATH"
              },
              get_word = "NVIM_CONFIG_PATH"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 218>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40450,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <219>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 219>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <220>{
          cache = {
            entries = {
              get_completion_item = <221>{
                data = {
                  id = 1680,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "Normal",
                insertTextFormat = 2,
                kind = 3,
                label = "Normal(str)",
                sortText = "0072"
              },
              get_filter_text = "Normal(str)",
              get_insert_text = "Normal",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "Normal(str)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "Normal"
              },
              get_word = "Normal"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 221>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40451,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <222>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 222>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <223>{
          cache = {
            entries = {
              get_completion_item = <224>{
                data = {
                  id = 1681,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "NvimTreeFloat",
                insertTextFormat = 2,
                kind = 3,
                label = "NvimTreeFloat(enable)",
                sortText = "0073"
              },
              get_filter_text = "NvimTreeFloat(enable)",
              get_insert_text = "NvimTreeFloat",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "NvimTreeFloat(enable)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "NvimTreeFloat"
              },
              get_word = "NvimTreeFloat"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 224>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40452,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <225>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 225>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <226>{
          cache = {
            entries = {
              get_completion_item = <227>{
                data = {
                  id = 1682,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "P",
                insertTextFormat = 2,
                kind = 3,
                label = "P(...)",
                sortText = "0074"
              },
              get_filter_text = "P(...)",
              get_insert_text = "P",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "P(...)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "P"
              },
              get_word = "P"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 227>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40453,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <228>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 228>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <229>{
          cache = {
            entries = {
              get_completion_item = <230>{
                data = {
                  id = 1683,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "PASSED",
                sortText = "0075"
              },
              get_filter_text = "PASSED",
              get_insert_text = "PASSED",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "PASSED",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "PASSED"
              },
              get_word = "PASSED"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 230>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40454,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <231>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 231>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <232>{
          cache = {
            entries = {
              get_completion_item = <233>{
                data = {
                  id = 1684,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "PLENARY_DEBUG",
                sortText = "0076"
              },
              get_filter_text = "PLENARY_DEBUG",
              get_insert_text = "PLENARY_DEBUG",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "PLENARY_DEBUG",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "PLENARY_DEBUG"
              },
              get_word = "PLENARY_DEBUG"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 233>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40455,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <234>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 234>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <235>{
          cache = {
            entries = {
              get_completion_item = <236>{
                data = {
                  id = 1685,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "Popup",
                sortText = "0077"
              },
              get_filter_text = "Popup",
              get_insert_text = "Popup",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "Popup",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "Popup"
              },
              get_word = "Popup"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 236>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40456,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <237>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 237>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <238>{
          cache = {
            entries = {
              get_completion_item = <239>{
                data = {
                  id = 1686,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "PrefixMap",
                insertTextFormat = 2,
                kind = 3,
                label = "PrefixMap(mode, key_prefix, desc_prefix, outer_opts)",
                sortText = "0078"
              },
              get_filter_text = "PrefixMap(mode, key_prefix, desc_prefix, outer_opts)",
              get_insert_text = "PrefixMap",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "PrefixMap(mode, key_prefix, desc_prefix, outer_opts)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "PrefixMap"
              },
              get_word = "PrefixMap"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 239>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40457,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <240>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 240>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <241>{
          cache = {
            entries = {
              get_completion_item = <242>{
                data = {
                  id = 1687,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "PrevPos",
                sortText = "0079"
              },
              get_filter_text = "PrevPos",
              get_insert_text = "PrevPos",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "PrevPos",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "PrevPos"
              },
              get_word = "PrevPos"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 242>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40458,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <243>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 243>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <244>{
          cache = {
            entries = {
              get_completion_item = <245>{
                data = {
                  id = 1688,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "PrevWinWidth",
                sortText = "0080"
              },
              get_filter_text = "PrevWinWidth",
              get_insert_text = "PrevWinWidth",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "PrevWinWidth",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "PrevWinWidth"
              },
              get_word = "PrevWinWidth"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 245>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40459,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <246>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 246>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <247>{
          cache = {
            entries = {
              get_completion_item = <248>{
                data = {
                  id = 1689,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "QuitLastBuffer",
                insertTextFormat = 2,
                kind = 3,
                label = "QuitLastBuffer()",
                sortText = "0081"
              },
              get_filter_text = "QuitLastBuffer()",
              get_insert_text = "QuitLastBuffer",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "QuitLastBuffer()",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "QuitLastBuffer"
              },
              get_word = "QuitLastBuffer"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 248>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40460,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <249>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 249>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <250>{
          cache = {
            entries = {
              get_completion_item = <251>{
                data = {
                  id = 1690,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "R",
                insertTextFormat = 2,
                kind = 3,
                label = "R(name)",
                sortText = "0082"
              },
              get_filter_text = "R(name)",
              get_insert_text = "R",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "R(name)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "R"
              },
              get_word = "R"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 251>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40461,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <252>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 252>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <253>{
          cache = {
            entries = {
              get_completion_item = <254>{
                data = {
                  id = 1691,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "RELOAD",
                insertTextFormat = 2,
                kind = 3,
                label = "RELOAD(...)",
                sortText = "0083"
              },
              get_filter_text = "RELOAD(...)",
              get_insert_text = "RELOAD",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "RELOAD(...)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "RELOAD"
              },
              get_word = "RELOAD"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 254>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40462,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <255>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 255>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <256>{
          cache = {
            entries = {
              get_completion_item = <257>{
                data = {
                  id = 1692,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 13,
                label = "REQUIRES_FILE_NAME",
                sortText = "0084"
              },
              get_filter_text = "REQUIRES_FILE_NAME",
              get_insert_text = "REQUIRES_FILE_NAME",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "REQUIRES_FILE_NAME",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "REQUIRES_FILE_NAME"
              },
              get_word = "REQUIRES_FILE_NAME"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 257>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40463,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <258>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 258>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <259>{
          cache = {
            entries = {
              get_completion_item = <260>{
                data = {
                  id = 1693,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "RESET",
                insertTextFormat = 2,
                kind = 3,
                label = "RESET(name)",
                sortText = "0085"
              },
              get_filter_text = "RESET(name)",
              get_insert_text = "RESET",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "RESET(name)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "RESET"
              },
              get_word = "RESET"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 260>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40464,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <261>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 261>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <262>{
          cache = {
            entries = {
              get_completion_item = <263>{
                data = {
                  id = 1694,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "ReloadAll",
                insertTextFormat = 2,
                kind = 3,
                label = "ReloadAll()",
                sortText = "0086"
              },
              get_filter_text = "ReloadAll()",
              get_insert_text = "ReloadAll",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "ReloadAll()",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "ReloadAll"
              },
              get_word = "ReloadAll"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 263>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40465,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <264>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 264>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <265>{
          cache = {
            entries = {
              get_completion_item = <266>{
                data = {
                  id = 1695,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "Schedule",
                insertTextFormat = 2,
                kind = 3,
                label = "Schedule(fn, ...)",
                sortText = "0087"
              },
              get_filter_text = "Schedule(fn, ...)",
              get_insert_text = "Schedule",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "Schedule(fn, ...)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "Schedule"
              },
              get_word = "Schedule"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 266>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40466,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <267>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 267>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <268>{
          cache = {
            entries = {
              get_completion_item = <269>{
                data = {
                  id = 1696,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "Sectionize",
                insertTextFormat = 2,
                kind = 3,
                label = "Sectionize(size, location, divider, surround)",
                sortText = "0088"
              },
              get_filter_text = "Sectionize(size, location, divider, surround)",
              get_insert_text = "Sectionize",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "Sectionize(size, location, divider, surround)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "Sectionize"
              },
              get_word = "Sectionize"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 269>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40467,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <270>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 270>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <271>{
          cache = {
            entries = {
              get_completion_item = <272>{
                data = {
                  id = 1697,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "SetColors",
                insertTextFormat = 2,
                kind = 3,
                label = "SetColors(theme)",
                sortText = "0089"
              },
              get_filter_text = "SetColors(theme)",
              get_insert_text = "SetColors",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "SetColors(theme)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "SetColors"
              },
              get_word = "SetColors"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 272>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40468,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <273>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 273>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <274>{
          cache = {
            entries = {
              get_completion_item = <275>{
                data = {
                  id = 1698,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 13,
                label = "Shape",
                sortText = "0090"
              },
              get_filter_text = "Shape",
              get_insert_text = "Shape",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "Shape",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "Shape"
              },
              get_word = "Shape"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 275>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40469,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <276>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 276>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <277>{
          cache = {
            entries = {
              get_completion_item = <278>{
                data = {
                  id = 1699,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "StoreFunction",
                insertTextFormat = 2,
                kind = 3,
                label = "StoreFunction(funref, ...)",
                sortText = "0091"
              },
              get_filter_text = "StoreFunction(funref, ...)",
              get_insert_text = "StoreFunction",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "StoreFunction(funref, ...)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "StoreFunction"
              },
              get_word = "StoreFunction"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 278>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40470,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <279>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 279>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <280>{
          cache = {
            entries = {
              get_completion_item = <281>{
                data = {
                  id = 1700,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "StoredFunctions",
                sortText = "0092"
              },
              get_filter_text = "StoredFunctions",
              get_insert_text = "StoredFunctions",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "StoredFunctions",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "StoredFunctions"
              },
              get_word = "StoredFunctions"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 281>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40471,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <282>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 282>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <283>{
          cache = {
            entries = {
              get_completion_item = <284>{
                data = {
                  id = 1701,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "Surrounder",
                insertTextFormat = 2,
                kind = 3,
                label = "Surrounder(...)",
                sortText = "0093"
              },
              get_filter_text = "Surrounder(...)",
              get_insert_text = "Surrounder",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "Surrounder(...)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "Surrounder"
              },
              get_word = "Surrounder"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 284>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40472,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <285>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 285>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <286>{
          cache = {
            entries = {
              get_completion_item = <287>{
                data = {
                  id = 1702,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "TelescopeGlobalState",
                sortText = "0094"
              },
              get_filter_text = "TelescopeGlobalState",
              get_insert_text = "TelescopeGlobalState",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "TelescopeGlobalState",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "TelescopeGlobalState"
              },
              get_word = "TelescopeGlobalState"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 287>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40473,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <288>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 288>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <289>{
          cache = {
            entries = {
              get_completion_item = <290>{
                data = {
                  id = 1703,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "UpdateAllRequireFiles",
                insertTextFormat = 2,
                kind = 3,
                label = "UpdateAllRequireFiles()",
                sortText = "0095"
              },
              get_filter_text = "UpdateAllRequireFiles()",
              get_insert_text = "UpdateAllRequireFiles",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "UpdateAllRequireFiles()",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "UpdateAllRequireFiles"
              },
              get_word = "UpdateAllRequireFiles"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 290>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40474,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <291>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 291>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <292>{
          cache = {
            entries = {
              get_completion_item = <293>{
                data = {
                  id = 1704,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "WriteFile",
                insertTextFormat = 2,
                kind = 3,
                label = "WriteFile(path, text, append)",
                sortText = "0096"
              },
              get_filter_text = "WriteFile(path, text, append)",
              get_insert_text = "WriteFile",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "WriteFile(path, text, append)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "WriteFile"
              },
              get_word = "WriteFile"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 293>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40475,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <294>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 294>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <295>{
          cache = {
            entries = {
              get_completion_item = <296>{
                data = {
                  id = 1705,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "YankOperator",
                insertTextFormat = 2,
                kind = 3,
                label = "YankOperator(type)",
                sortText = "0097"
              },
              get_filter_text = "YankOperator(type)",
              get_insert_text = "YankOperator",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "YankOperator(type)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "YankOperator"
              },
              get_word = "YankOperator"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 296>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40476,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <297>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 297>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <298>{
          cache = {
            entries = {
              get_completion_item = <299>{
                data = {
                  id = 1706,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "_",
                sortText = "0098"
              },
              get_filter_text = "_",
              get_insert_text = "_",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "_",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "_"
              },
              get_word = "_"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 299>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40477,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <300>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 300>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <301>{
          cache = {
            entries = {
              get_completion_item = <302>{
                data = {
                  id = 1707,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "_AssociatedBufs",
                sortText = "0099"
              },
              get_filter_text = "_AssociatedBufs",
              get_insert_text = "_AssociatedBufs",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "_AssociatedBufs",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "_AssociatedBufs"
              },
              get_word = "_AssociatedBufs"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 302>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40478,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <303>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 303>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <304>{
          cache = {
            entries = {
              get_completion_item = <305>{
                data = {
                  id = 1708,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "_G",
                sortText = "0100"
              },
              get_filter_text = "_G",
              get_insert_text = "_G",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "_G",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "_G"
              },
              get_word = "_G"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 305>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40479,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <306>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 306>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <307>{
          cache = {
            entries = {
              get_completion_item = <308>{
                data = {
                  id = 1709,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "_LspMessageBuffer",
                sortText = "0101"
              },
              get_filter_text = "_LspMessageBuffer",
              get_insert_text = "_LspMessageBuffer",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "_LspMessageBuffer",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "_LspMessageBuffer"
              },
              get_word = "_LspMessageBuffer"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 308>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40480,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <309>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 309>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <310>{
          cache = {
            entries = {
              get_completion_item = <311>{
                data = {
                  id = 1710,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 13,
                label = "_NEOTEST_IS_CHILD",
                sortText = "0102"
              },
              get_filter_text = "_NEOTEST_IS_CHILD",
              get_insert_text = "_NEOTEST_IS_CHILD",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "_NEOTEST_IS_CHILD",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "_NEOTEST_IS_CHILD"
              },
              get_word = "_NEOTEST_IS_CHILD"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 311>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40481,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <312>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 312>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <313>{
          cache = {
            entries = {
              get_completion_item = <314>{
                data = {
                  id = 1711,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "_PlenaryBustedOldAssert",
                sortText = "0103"
              },
              get_filter_text = "_PlenaryBustedOldAssert",
              get_insert_text = "_PlenaryBustedOldAssert",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "_PlenaryBustedOldAssert",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "_PlenaryBustedOldAssert"
              },
              get_word = "_PlenaryBustedOldAssert"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 314>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40482,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <315>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 315>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <316>{
          cache = {
            entries = {
              get_completion_item = <317>{
                data = {
                  id = 1712,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "_PlenaryLeafTable",
                sortText = "0104"
              },
              get_filter_text = "_PlenaryLeafTable",
              get_insert_text = "_PlenaryLeafTable",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "_PlenaryLeafTable",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "_PlenaryLeafTable"
              },
              get_word = "_PlenaryLeafTable"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 317>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40483,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <318>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 318>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <319>{
          cache = {
            entries = {
              get_completion_item = <320>{
                data = {
                  id = 1713,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "_TelescopeConfigurationPickers",
                sortText = "0105"
              },
              get_filter_text = "_TelescopeConfigurationPickers",
              get_insert_text = "_TelescopeConfigurationPickers",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "_TelescopeConfigurationPickers",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "_TelescopeConfigurationPickers"
              },
              get_word = "_TelescopeConfigurationPickers"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 320>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40484,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <321>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 321>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <322>{
          cache = {
            entries = {
              get_completion_item = <323>{
                data = {
                  id = 1714,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "_TelescopeConfigurationValues",
                sortText = "0106"
              },
              get_filter_text = "_TelescopeConfigurationValues",
              get_insert_text = "_TelescopeConfigurationValues",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "_TelescopeConfigurationValues",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "_TelescopeConfigurationValues"
              },
              get_word = "_TelescopeConfigurationValues"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 323>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40485,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <324>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 324>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <325>{
          cache = {
            entries = {
              get_completion_item = <326>{
                data = {
                  id = 1715,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 13,
                label = "_VERSION",
                sortText = "0107"
              },
              get_filter_text = "_VERSION",
              get_insert_text = "_VERSION",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "_VERSION",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "_VERSION"
              },
              get_word = "_VERSION"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 326>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40486,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <327>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 327>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <328>{
          cache = {
            entries = {
              get_completion_item = <329>{
                data = {
                  id = 1716,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "__TelescopeKeymapStore",
                sortText = "0108"
              },
              get_filter_text = "__TelescopeKeymapStore",
              get_insert_text = "__TelescopeKeymapStore",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "__TelescopeKeymapStore",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "__TelescopeKeymapStore"
              },
              get_word = "__TelescopeKeymapStore"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 329>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40487,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <330>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 330>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <331>{
          cache = {
            entries = {
              get_completion_item = <332>{
                data = {
                  id = 1717,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "_packer",
                sortText = "0109"
              },
              get_filter_text = "_packer",
              get_insert_text = "_packer",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "_packer",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "_packer"
              },
              get_word = "_packer"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 332>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40488,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <333>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 333>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <334>{
          cache = {
            entries = {
              get_completion_item = <335>{
                data = {
                  id = 1718,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "a",
                sortText = "0110"
              },
              get_filter_text = "a",
              get_insert_text = "a",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "a",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "a"
              },
              get_word = "a"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 335>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40489,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <336>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 336>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <337>{
          cache = {
            entries = {
              get_completion_item = <338>{
                data = {
                  id = 1719,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "after_each",
                sortText = "0111"
              },
              get_filter_text = "after_each",
              get_insert_text = "after_each",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "after_each",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "after_each"
              },
              get_word = "after_each"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 338>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40490,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <339>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 339>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <340>{
          cache = {
            entries = {
              get_completion_item = <341>{
                data = {
                  id = 1720,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "arg",
                sortText = "0112"
              },
              get_filter_text = "arg",
              get_insert_text = "arg",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "arg",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "arg"
              },
              get_word = "arg"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 341>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40491,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <342>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 342>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <343>{
          cache = {
            entries = {
              get_completion_item = <344>{
                data = {
                  id = 1721,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "assert",
                sortText = "0113"
              },
              get_filter_text = "assert",
              get_insert_text = "assert",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "assert",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "assert"
              },
              get_word = "assert"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 344>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40492,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <345>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 345>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <346>{
          cache = {
            entries = {
              get_completion_item = <347>{
                data = {
                  id = 1722,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "assert",
                insertTextFormat = 2,
                kind = 3,
                label = "assert(v, message, ...)",
                sortText = "0114"
              },
              get_filter_text = "assert(v, message, ...)",
              get_insert_text = "assert",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "assert(v, message, ...)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "assert"
              },
              get_word = "assert"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 347>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40493,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <348>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 348>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <349>{
          cache = {
            entries = {
              get_completion_item = <350>{
                data = {
                  id = 1723,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "async",
                sortText = "0115"
              },
              get_filter_text = "async",
              get_insert_text = "async",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "async",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "async"
              },
              get_word = "async"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 350>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40494,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <351>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 351>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <352>{
          cache = {
            entries = {
              get_completion_item = <353>{
                data = {
                  id = 1724,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "await",
                sortText = "0116"
              },
              get_filter_text = "await",
              get_insert_text = "await",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "await",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "await"
              },
              get_word = "await"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 353>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40495,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <354>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 354>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <355>{
          cache = {
            entries = {
              get_completion_item = <356>{
                data = {
                  id = 1725,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "await_all",
                sortText = "0117"
              },
              get_filter_text = "await_all",
              get_insert_text = "await_all",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "await_all",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "await_all"
              },
              get_word = "await_all"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 356>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40496,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <357>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 357>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <358>{
          cache = {
            entries = {
              get_completion_item = <359>{
                data = {
                  id = 1726,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "before_each",
                sortText = "0118"
              },
              get_filter_text = "before_each",
              get_insert_text = "before_each",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "before_each",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "before_each"
              },
              get_word = "before_each"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 359>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40497,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <360>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 360>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <361>{
          cache = {
            entries = {
              get_completion_item = <362>{
                data = {
                  id = 1727,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "bit",
                sortText = "0119"
              },
              get_filter_text = "bit",
              get_insert_text = "bit",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "bit",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "bit"
              },
              get_word = "bit"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 362>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40498,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <363>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 363>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <364>{
          cache = {
            entries = {
              get_completion_item = <365>{
                data = {
                  id = 1728,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "buf_border",
                sortText = "0120"
              },
              get_filter_text = "buf_border",
              get_insert_text = "buf_border",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "buf_border",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "buf_border"
              },
              get_word = "buf_border"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 365>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40499,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <366>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 366>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <367>{
          cache = {
            entries = {
              get_completion_item = <368>{
                data = {
                  id = 1729,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "buf_text",
                sortText = "0121"
              },
              get_filter_text = "buf_text",
              get_insert_text = "buf_text",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "buf_text",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "buf_text"
              },
              get_word = "buf_text"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 368>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40500,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <369>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 369>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <370>{
          cache = {
            entries = {
              get_completion_item = <371>{
                data = {
                  id = 1730,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "clear",
                sortText = "0122"
              },
              get_filter_text = "clear",
              get_insert_text = "clear",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "clear",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "clear"
              },
              get_word = "clear"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 371>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40501,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <372>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 372>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <373>{
          cache = {
            entries = {
              get_completion_item = <374>{
                data = {
                  id = 1731,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "cmap",
                sortText = "0123"
              },
              get_filter_text = "cmap",
              get_insert_text = "cmap",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "cmap",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "cmap"
              },
              get_word = "cmap"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 374>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40502,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <375>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 375>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <376>{
          cache = {
            entries = {
              get_completion_item = <377>{
                data = {
                  id = 1732,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "collectgarbage",
                insertTextFormat = 2,
                kind = 3,
                label = "collectgarbage(opt, arg)",
                sortText = "0124"
              },
              get_filter_text = "collectgarbage(opt, arg)",
              get_insert_text = "collectgarbage",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "collectgarbage(opt, arg)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "collectgarbage"
              },
              get_word = "collectgarbage"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 377>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40503,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <378>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 378>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <379>{
          cache = {
            entries = {
              get_completion_item = <380>{
                data = {
                  id = 1733,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "contains",
                insertTextFormat = 2,
                kind = 3,
                label = "contains(list, x)",
                sortText = "0125"
              },
              get_filter_text = "contains(list, x)",
              get_insert_text = "contains",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "contains(list, x)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "contains"
              },
              get_word = "contains"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 380>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40504,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <381>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 381>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <382>{
          cache = {
            entries = {
              get_completion_item = <383>{
                data = {
                  id = 1734,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "coroutine",
                sortText = "0126"
              },
              get_filter_text = "coroutine",
              get_insert_text = "coroutine",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "coroutine",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "coroutine"
              },
              get_word = "coroutine"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 383>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40505,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <384>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 384>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <385>{
          cache = {
            entries = {
              get_completion_item = <386>{
                data = {
                  id = 1735,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "countreferences",
                insertTextFormat = 2,
                kind = 3,
                label = "countreferences(value)",
                sortText = "0127"
              },
              get_filter_text = "countreferences(value)",
              get_insert_text = "countreferences",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "countreferences(value)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "countreferences"
              },
              get_word = "countreferences"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 386>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40506,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <387>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 387>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <388>{
          cache = {
            entries = {
              get_completion_item = <389>{
                data = {
                  id = 1736,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "create_statusline",
                insertTextFormat = 2,
                kind = 3,
                label = "create_statusline()",
                sortText = "0128"
              },
              get_filter_text = "create_statusline()",
              get_insert_text = "create_statusline",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "create_statusline()",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "create_statusline"
              },
              get_word = "create_statusline"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 389>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40507,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <390>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 390>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <391>{
          cache = {
            entries = {
              get_completion_item = <392>{
                data = {
                  id = 1737,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "current_win_id",
                sortText = "0129"
              },
              get_filter_text = "current_win_id",
              get_insert_text = "current_win_id",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "current_win_id",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "current_win_id"
              },
              get_word = "current_win_id"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 392>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40508,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <393>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 393>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <394>{
          cache = {
            entries = {
              get_completion_item = <395>{
                data = {
                  id = 1738,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "debug",
                sortText = "0130"
              },
              get_filter_text = "debug",
              get_insert_text = "debug",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "debug",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "debug"
              },
              get_word = "debug"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 395>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40509,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <396>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 396>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <397>{
          cache = {
            entries = {
              get_completion_item = <398>{
                data = {
                  id = 1739,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "describe",
                sortText = "0131"
              },
              get_filter_text = "describe",
              get_insert_text = "describe",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "describe",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "describe"
              },
              get_word = "describe"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 398>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40510,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <399>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 399>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <400>{
          cache = {
            entries = {
              get_completion_item = <401>{
                data = {
                  id = 1740,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "dofile",
                insertTextFormat = 2,
                kind = 3,
                label = "dofile(filename)",
                sortText = "0132"
              },
              get_filter_text = "dofile(filename)",
              get_insert_text = "dofile",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "dofile(filename)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "dofile"
              },
              get_word = "dofile"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 401>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40511,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <402>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 402>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <403>{
          cache = {
            entries = {
              get_completion_item = <404>{
                data = {
                  id = 1741,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "edge",
                insertTextFormat = 2,
                kind = 3,
                label = "edge(env, from, to, how, value)",
                sortText = "0133"
              },
              get_filter_text = "edge(env, from, to, how, value)",
              get_insert_text = "edge",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "edge(env, from, to, how, value)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "edge"
              },
              get_word = "edge"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 404>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40512,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <405>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 405>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <406>{
          cache = {
            entries = {
              get_completion_item = <407>{
                data = {
                  id = 1742,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "error",
                insertTextFormat = 2,
                kind = 3,
                label = "error(message, level)",
                sortText = "0134"
              },
              get_filter_text = "error(message, level)",
              get_insert_text = "error",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "error(message, level)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "error"
              },
              get_word = "error"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 407>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40513,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <408>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 408>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <409>{
          cache = {
            entries = {
              get_completion_item = <410>{
                data = {
                  id = 1743,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "findallpaths",
                insertTextFormat = 2,
                kind = 3,
                label = "findallpaths(obj)",
                sortText = "0135"
              },
              get_filter_text = "findallpaths(obj)",
              get_insert_text = "findallpaths",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "findallpaths(obj)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "findallpaths"
              },
              get_word = "findallpaths"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 410>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40514,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <411>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 411>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <412>{
          cache = {
            entries = {
              get_completion_item = <413>{
                data = {
                  id = 1744,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "foo",
                insertTextFormat = 2,
                kind = 3,
                label = "foo(x)",
                sortText = "0136"
              },
              get_filter_text = "foo(x)",
              get_insert_text = "foo",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "foo(x)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "foo"
              },
              get_word = "foo"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 413>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40515,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <414>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 414>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <415>{
          cache = {
            entries = {
              get_completion_item = <416>{
                data = {
                  id = 1745,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "get_char_under_cursor",
                insertTextFormat = 2,
                kind = 3,
                label = "get_char_under_cursor(line, column)",
                sortText = "0137"
              },
              get_filter_text = "get_char_under_cursor(line, column)",
              get_insert_text = "get_char_under_cursor",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "get_char_under_cursor(line, column)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "get_char_under_cursor"
              },
              get_word = "get_char_under_cursor"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 416>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40516,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <417>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 417>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <418>{
          cache = {
            entries = {
              get_completion_item = <419>{
                data = {
                  id = 1746,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "get_closest",
                insertTextFormat = 2,
                kind = 3,
                label = "get_closest()",
                sortText = "0138"
              },
              get_filter_text = "get_closest()",
              get_insert_text = "get_closest",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "get_closest()",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "get_closest"
              },
              get_word = "get_closest"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 419>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40517,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <420>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 420>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <421>{
          cache = {
            entries = {
              get_completion_item = <422>{
                data = {
                  id = 1747,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "get_matches_in_line",
                insertTextFormat = 2,
                kind = 3,
                label = "get_matches_in_line(col, char)",
                sortText = "0139"
              },
              get_filter_text = "get_matches_in_line(col, char)",
              get_insert_text = "get_matches_in_line",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "get_matches_in_line(col, char)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "get_matches_in_line"
              },
              get_word = "get_matches_in_line"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 422>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40518,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <423>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 423>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <424>{
          cache = {
            entries = {
              get_completion_item = <425>{
                data = {
                  id = 1748,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "getfenv",
                insertTextFormat = 2,
                kind = 3,
                label = "getfenv(f)",
                sortText = "0140"
              },
              get_filter_text = "getfenv(f)",
              get_insert_text = "getfenv",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "getfenv(f)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "getfenv"
              },
              get_word = "getfenv"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 425>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40519,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <426>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 426>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <427>{
          cache = {
            entries = {
              get_completion_item = <428>{
                data = {
                  id = 1749,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "getmetatable",
                insertTextFormat = 2,
                kind = 3,
                label = "getmetatable(object)",
                sortText = "0141"
              },
              get_filter_text = "getmetatable(object)",
              get_insert_text = "getmetatable",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "getmetatable(object)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "getmetatable"
              },
              get_word = "getmetatable"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 428>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40520,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <429>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 429>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <430>{
          cache = {
            entries = {
              get_completion_item = <431>{
                data = {
                  id = 1750,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "hop",
                sortText = "0142"
              },
              get_filter_text = "hop",
              get_insert_text = "hop",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "hop",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "hop"
              },
              get_word = "hop"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 431>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40521,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <432>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 432>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <433>{
          cache = {
            entries = {
              get_completion_item = <434>{
                data = {
                  id = 1751,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "icmap",
                sortText = "0143"
              },
              get_filter_text = "icmap",
              get_insert_text = "icmap",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "icmap",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "icmap"
              },
              get_word = "icmap"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 434>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40522,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <435>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 435>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <436>{
          cache = {
            entries = {
              get_completion_item = <437>{
                data = {
                  id = 1752,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "imap",
                sortText = "0144"
              },
              get_filter_text = "imap",
              get_insert_text = "imap",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "imap",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "imap"
              },
              get_word = "imap"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 437>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40523,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <438>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 438>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <439>{
          cache = {
            entries = {
              get_completion_item = <440>{
                data = {
                  id = 1753,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "index_of",
                insertTextFormat = 2,
                kind = 3,
                label = "index_of(array, value)",
                sortText = "0145"
              },
              get_filter_text = "index_of(array, value)",
              get_insert_text = "index_of",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "index_of(array, value)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "index_of"
              },
              get_word = "index_of"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 440>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40524,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <441>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 441>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <442>{
          cache = {
            entries = {
              get_completion_item = <443>{
                data = {
                  id = 1754,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "io",
                sortText = "0146"
              },
              get_filter_text = "io",
              get_insert_text = "io",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "io",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "io"
              },
              get_word = "io"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 443>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40525,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <444>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 444>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <445>{
          cache = {
            entries = {
              get_completion_item = <446>{
                data = {
                  id = 1755,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "ipairs",
                insertTextFormat = 2,
                kind = 3,
                label = "ipairs(t)",
                sortText = "0147"
              },
              get_filter_text = "ipairs(t)",
              get_insert_text = "ipairs",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "ipairs(t)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "ipairs"
              },
              get_word = "ipairs"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 446>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40526,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <447>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 447>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <448>{
          cache = {
            entries = {
              get_completion_item = <449>{
                data = {
                  id = 1756,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "it",
                sortText = "0148"
              },
              get_filter_text = "it",
              get_insert_text = "it",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "it",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "it"
              },
              get_word = "it"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 449>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40527,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <450>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 450>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <451>{
          cache = {
            entries = {
              get_completion_item = <452>{
                data = {
                  id = 1757,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "jit",
                sortText = "0149"
              },
              get_filter_text = "jit",
              get_insert_text = "jit",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "jit",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "jit"
              },
              get_word = "jit"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 452>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40528,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <453>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 453>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <454>{
          cache = {
            entries = {
              get_completion_item = <455>{
                data = {
                  id = 1758,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "load",
                insertTextFormat = 2,
                kind = 3,
                label = "load(chunk, chunkname, mode, env)",
                sortText = "0150"
              },
              get_filter_text = "load(chunk, chunkname, mode, env)",
              get_insert_text = "load",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "load(chunk, chunkname, mode, env)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "load"
              },
              get_word = "load"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 455>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40529,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <456>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 456>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <457>{
          cache = {
            entries = {
              get_completion_item = <458>{
                data = {
                  id = 1759,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "loadfile",
                insertTextFormat = 2,
                kind = 3,
                label = "loadfile(filename, mode, env)",
                sortText = "0151"
              },
              get_filter_text = "loadfile(filename, mode, env)",
              get_insert_text = "loadfile",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "loadfile(filename, mode, env)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "loadfile"
              },
              get_word = "loadfile"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 458>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40530,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <459>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 459>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <460>{
          cache = {
            entries = {
              get_completion_item = <461>{
                data = {
                  id = 1760,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "loadstring",
                insertTextFormat = 2,
                kind = 3,
                label = "loadstring(text, chunkname)",
                sortText = "0152"
              },
              get_filter_text = "loadstring(text, chunkname)",
              get_insert_text = "loadstring",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "loadstring(text, chunkname)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "loadstring"
              },
              get_word = "loadstring"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 461>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40531,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <462>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 462>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <463>{
          cache = {
            entries = {
              get_completion_item = <464>{
                data = {
                  id = 1761,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "map",
                insertTextFormat = 2,
                kind = 3,
                label = "map(op, lhs, rhs, description, opts)",
                sortText = "0153"
              },
              get_filter_text = "map(op, lhs, rhs, description, opts)",
              get_insert_text = "map",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "map(op, lhs, rhs, description, opts)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "map"
              },
              get_word = "map"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 464>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40532,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <465>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 465>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <466>{
          cache = {
            entries = {
              get_completion_item = <467>{
                data = {
                  id = 1762,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "match",
                sortText = "0154"
              },
              get_filter_text = "match",
              get_insert_text = "match",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "match",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "match"
              },
              get_word = "match"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 467>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40533,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <468>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 468>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <469>{
          cache = {
            entries = {
              get_completion_item = <470>{
                data = {
                  id = 1763,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "math",
                sortText = "0155"
              },
              get_filter_text = "math",
              get_insert_text = "math",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "math",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "math"
              },
              get_word = "math"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 470>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40534,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <471>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 471>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <472>{
          cache = {
            entries = {
              get_completion_item = <473>{
                data = {
                  id = 1764,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "module",
                insertTextFormat = 2,
                kind = 3,
                label = "module(name, ...)",
                sortText = "0156"
              },
              get_filter_text = "module(name, ...)",
              get_insert_text = "module",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "module(name, ...)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "module"
              },
              get_word = "module"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 473>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40535,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <474>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 474>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <475>{
          cache = {
            entries = {
              get_completion_item = <476>{
                data = {
                  id = 1765,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "newproxy",
                insertTextFormat = 2,
                kind = 3,
                label = "newproxy(proxy)",
                sortText = "0157"
              },
              get_filter_text = "newproxy(proxy)",
              get_insert_text = "newproxy",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "newproxy(proxy)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "newproxy"
              },
              get_word = "newproxy"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 476>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40536,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <477>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 477>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <478>{
          cache = {
            entries = {
              get_completion_item = <479>{
                data = {
                  id = 1766,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "next",
                insertTextFormat = 2,
                kind = 3,
                label = "next(table, index)",
                sortText = "0158"
              },
              get_filter_text = "next(table, index)",
              get_insert_text = "next",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "next(table, index)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "next"
              },
              get_word = "next"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 479>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40537,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <480>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 480>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <481>{
          cache = {
            entries = {
              get_completion_item = <482>{
                data = {
                  id = 1767,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "nmap",
                sortText = "0159"
              },
              get_filter_text = "nmap",
              get_insert_text = "nmap",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "nmap",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "nmap"
              },
              get_word = "nmap"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 482>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40538,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <483>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 483>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <484>{
          cache = {
            entries = {
              get_completion_item = <485>{
                data = {
                  id = 1768,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "nremap",
                sortText = "0160"
              },
              get_filter_text = "nremap",
              get_insert_text = "nremap",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "nremap",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "nremap"
              },
              get_word = "nremap"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 485>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40539,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <486>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 486>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <487>{
          cache = {
            entries = {
              get_completion_item = <488>{
                data = {
                  id = 1769,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "nvmap",
                sortText = "0161"
              },
              get_filter_text = "nvmap",
              get_insert_text = "nvmap",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "nvmap",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "nvmap"
              },
              get_word = "nvmap"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 488>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40540,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <489>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 489>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <490>{
          cache = {
            entries = {
              get_completion_item = <491>{
                data = {
                  id = 1770,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "omap",
                sortText = "0162"
              },
              get_filter_text = "omap",
              get_insert_text = "omap",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "omap",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "omap"
              },
              get_word = "omap"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 491>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40541,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <492>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 492>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <493>{
          cache = {
            entries = {
              get_completion_item = <494>{
                data = {
                  id = 1771,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "os",
                sortText = "0163"
              },
              get_filter_text = "os",
              get_insert_text = "os",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "os",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "os"
              },
              get_word = "os"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 494>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40542,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <495>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 495>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <496>{
          cache = {
            entries = {
              get_completion_item = <497>{
                data = {
                  id = 1772,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "package",
                sortText = "0164"
              },
              get_filter_text = "package",
              get_insert_text = "package",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "package",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "package"
              },
              get_word = "package"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 497>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40543,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <498>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 498>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <499>{
          cache = {
            entries = {
              get_completion_item = <500>{
                data = {
                  id = 1773,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 13,
                label = "packer_plugins",
                sortText = "0165"
              },
              get_filter_text = "packer_plugins",
              get_insert_text = "packer_plugins",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "packer_plugins",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "packer_plugins"
              },
              get_word = "packer_plugins"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 500>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40544,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <501>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 501>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <502>{
          cache = {
            entries = {
              get_completion_item = <503>{
                data = {
                  id = 1774,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "pairs",
                insertTextFormat = 2,
                kind = 3,
                label = "pairs(t)",
                sortText = "0166"
              },
              get_filter_text = "pairs(t)",
              get_insert_text = "pairs",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "pairs(t)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "pairs"
              },
              get_word = "pairs"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 503>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40545,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <504>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 504>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <505>{
          cache = {
            entries = {
              get_completion_item = <506>{
                data = {
                  id = 1775,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "pcall",
                insertTextFormat = 2,
                kind = 3,
                label = "pcall(f, arg1, ...)",
                sortText = "0167"
              },
              get_filter_text = "pcall(f, arg1, ...)",
              get_insert_text = "pcall",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "pcall(f, arg1, ...)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "pcall"
              },
              get_word = "pcall"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 506>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40546,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <507>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 507>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <508>{
          cache = {
            entries = {
              get_completion_item = <509>{
                data = {
                  id = 1776,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "pending",
                sortText = "0168"
              },
              get_filter_text = "pending",
              get_insert_text = "pending",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "pending",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "pending"
              },
              get_word = "pending"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 509>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40547,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <510>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 510>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <511>{
          cache = {
            entries = {
              get_completion_item = <512>{
                data = {
                  id = 1777,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "popts",
                sortText = "0169"
              },
              get_filter_text = "popts",
              get_insert_text = "popts",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "popts",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "popts"
              },
              get_word = "popts"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 512>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40548,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <513>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 513>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <514>{
          cache = {
            entries = {
              get_completion_item = <515>{
                data = {
                  id = 1778,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "print",
                insertTextFormat = 2,
                kind = 3,
                label = "print(...)",
                sortText = "0170"
              },
              get_filter_text = "print(...)",
              get_insert_text = "print",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "print(...)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "print"
              },
              get_word = "print"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 515>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40549,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <516>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 516>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <517>{
          cache = {
            entries = {
              get_completion_item = <518>{
                data = {
                  id = 1779,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "rawequal",
                insertTextFormat = 2,
                kind = 3,
                label = "rawequal(v1, v2)",
                sortText = "0171"
              },
              get_filter_text = "rawequal(v1, v2)",
              get_insert_text = "rawequal",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "rawequal(v1, v2)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "rawequal"
              },
              get_word = "rawequal"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 518>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40550,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <519>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 519>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <520>{
          cache = {
            entries = {
              get_completion_item = <521>{
                data = {
                  id = 1780,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "rawget",
                insertTextFormat = 2,
                kind = 3,
                label = "rawget(table, index)",
                sortText = "0172"
              },
              get_filter_text = "rawget(table, index)",
              get_insert_text = "rawget",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "rawget(table, index)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "rawget"
              },
              get_word = "rawget"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 521>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40551,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <522>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 522>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <523>{
          cache = {
            entries = {
              get_completion_item = <524>{
                data = {
                  id = 1781,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "rawlen",
                insertTextFormat = 2,
                kind = 3,
                label = "rawlen(v)",
                sortText = "0173"
              },
              get_filter_text = "rawlen(v)",
              get_insert_text = "rawlen",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "rawlen(v)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "rawlen"
              },
              get_word = "rawlen"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 524>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40552,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <525>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 525>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <526>{
          cache = {
            entries = {
              get_completion_item = <527>{
                data = {
                  id = 1782,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "rawset",
                insertTextFormat = 2,
                kind = 3,
                label = "rawset(table, index, value)",
                sortText = "0174"
              },
              get_filter_text = "rawset(table, index, value)",
              get_insert_text = "rawset",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "rawset(table, index, value)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "rawset"
              },
              get_word = "rawset"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 527>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40553,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <528>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 528>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <529>{
          cache = {
            entries = {
              get_completion_item = <530>{
                data = {
                  id = 1783,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "require",
                insertTextFormat = 2,
                kind = 3,
                label = "require(modname)",
                sortText = "0175"
              },
              get_filter_text = "require(modname)",
              get_insert_text = "require",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "require(modname)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "require"
              },
              get_word = "require"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 530>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40554,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <531>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 531>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <532>{
          cache = {
            entries = {
              get_completion_item = <533>{
                data = {
                  id = 1784,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "ret",
                sortText = "0176"
              },
              get_filter_text = "ret",
              get_insert_text = "ret",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "ret",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "ret"
              },
              get_word = "ret"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 533>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40555,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <534>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 534>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <535>{
          cache = {
            entries = {
              get_completion_item = <536>{
                data = {
                  id = 1785,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "rotate_n",
                insertTextFormat = 2,
                kind = 3,
                label = "rotate_n(first, ...)",
                sortText = "0177"
              },
              get_filter_text = "rotate_n(first, ...)",
              get_insert_text = "rotate_n",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "rotate_n(first, ...)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "rotate_n"
              },
              get_word = "rotate_n"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 536>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40556,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <537>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 537>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <538>{
          cache = {
            entries = {
              get_completion_item = <539>{
                data = {
                  id = 1786,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "select",
                insertTextFormat = 2,
                kind = 3,
                label = "select(index, ...)",
                sortText = "0178"
              },
              get_filter_text = "select(index, ...)",
              get_insert_text = "select",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "select(index, ...)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "select"
              },
              get_word = "select"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 539>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40557,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <540>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 540>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <541>{
          cache = {
            entries = {
              get_completion_item = <542>{
                data = {
                  id = 1787,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "setfenv",
                insertTextFormat = 2,
                kind = 3,
                label = "setfenv(f, table)",
                sortText = "0179"
              },
              get_filter_text = "setfenv(f, table)",
              get_insert_text = "setfenv",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "setfenv(f, table)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "setfenv"
              },
              get_word = "setfenv"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 542>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40558,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <543>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 543>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <544>{
          cache = {
            entries = {
              get_completion_item = <545>{
                data = {
                  id = 1788,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "setmetatable",
                insertTextFormat = 2,
                kind = 3,
                label = "setmetatable(table, metatable)",
                sortText = "0180"
              },
              get_filter_text = "setmetatable(table, metatable)",
              get_insert_text = "setmetatable",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "setmetatable(table, metatable)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "setmetatable"
              },
              get_word = "setmetatable"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 545>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40559,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <546>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 546>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <547>{
          cache = {
            entries = {
              get_completion_item = <548>{
                data = {
                  id = 1789,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "smap",
                sortText = "0181"
              },
              get_filter_text = "smap",
              get_insert_text = "smap",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "smap",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "smap"
              },
              get_word = "smap"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 548>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40560,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <549>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 549>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <550>{
          cache = {
            entries = {
              get_completion_item = <551>{
                data = {
                  id = 1790,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "start_mem",
                sortText = "0182"
              },
              get_filter_text = "start_mem",
              get_insert_text = "start_mem",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "start_mem",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "start_mem"
              },
              get_word = "start_mem"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 551>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40561,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <552>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 552>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <553>{
          cache = {
            entries = {
              get_completion_item = <554>{
                data = {
                  id = 1791,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "stat",
                sortText = "0183"
              },
              get_filter_text = "stat",
              get_insert_text = "stat",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "stat",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "stat"
              },
              get_word = "stat"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 554>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40562,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <555>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 555>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <556>{
          cache = {
            entries = {
              get_completion_item = <557>{
                data = {
                  id = 1792,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "string",
                sortText = "0184"
              },
              get_filter_text = "string",
              get_insert_text = "string",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "string",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "string"
              },
              get_word = "string"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 557>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40563,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <558>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 558>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <559>{
          cache = {
            entries = {
              get_completion_item = <560>{
                data = {
                  id = 1793,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "table",
                sortText = "0185"
              },
              get_filter_text = "table",
              get_insert_text = "table",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "table",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "table"
              },
              get_word = "table"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 560>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40564,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <561>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 561>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <562>{
          cache = {
            entries = {
              get_completion_item = <563>{
                data = {
                  id = 1794,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "test_automatic_buffer",
                insertTextFormat = 2,
                kind = 3,
                label = "test_automatic_buffer()",
                sortText = "0186"
              },
              get_filter_text = "test_automatic_buffer()",
              get_insert_text = "test_automatic_buffer",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "test_automatic_buffer()",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "test_automatic_buffer"
              },
              get_word = "test_automatic_buffer"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 563>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40565,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <564>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 564>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <565>{
          cache = {
            entries = {
              get_completion_item = <566>{
                data = {
                  id = 1795,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "tmap",
                sortText = "0187"
              },
              get_filter_text = "tmap",
              get_insert_text = "tmap",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "tmap",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "tmap"
              },
              get_word = "tmap"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 566>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40566,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <567>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 567>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <568>{
          cache = {
            entries = {
              get_completion_item = <569>{
                data = {
                  id = 1796,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "tonumber",
                insertTextFormat = 2,
                kind = 3,
                label = "tonumber(e)",
                sortText = "0188"
              },
              get_filter_text = "tonumber(e)",
              get_insert_text = "tonumber",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "tonumber(e)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "tonumber"
              },
              get_word = "tonumber"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 569>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40567,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <570>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 570>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <571>{
          cache = {
            entries = {
              get_completion_item = <572>{
                data = {
                  id = 1797,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "tonumber",
                insertTextFormat = 2,
                kind = 3,
                label = "tonumber(e, base)",
                sortText = "0189"
              },
              get_filter_text = "tonumber(e, base)",
              get_insert_text = "tonumber",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "tonumber(e, base)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "tonumber"
              },
              get_word = "tonumber"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 572>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40568,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <573>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 573>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <574>{
          cache = {
            entries = {
              get_completion_item = <575>{
                data = {
                  id = 1798,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "tostring",
                insertTextFormat = 2,
                kind = 3,
                label = "tostring(v)",
                sortText = "0190"
              },
              get_filter_text = "tostring(v)",
              get_insert_text = "tostring",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "tostring(v)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "tostring"
              },
              get_word = "tostring"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 575>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40569,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <576>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 576>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <577>{
          cache = {
            entries = {
              get_completion_item = <578>{
                data = {
                  id = 1799,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "traverse",
                insertTextFormat = 2,
                kind = 3,
                label = "traverse(funcs, ignoreobjs)",
                sortText = "0191"
              },
              get_filter_text = "traverse(funcs, ignoreobjs)",
              get_insert_text = "traverse",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "traverse(funcs, ignoreobjs)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "traverse"
              },
              get_word = "traverse"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 578>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40570,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <579>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 579>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <580>{
          cache = {
            entries = {
              get_completion_item = <581>{
                data = {
                  id = 1800,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "traversecdata",
                insertTextFormat = 2,
                kind = 3,
                label = "traversecdata(env, t)",
                sortText = "0192"
              },
              get_filter_text = "traversecdata(env, t)",
              get_insert_text = "traversecdata",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "traversecdata(env, t)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "traversecdata"
              },
              get_word = "traversecdata"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 581>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40571,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <582>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 582>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <583>{
          cache = {
            entries = {
              get_completion_item = <584>{
                data = {
                  id = 1801,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "traversefunction",
                insertTextFormat = 2,
                kind = 3,
                label = "traversefunction(env, obj)",
                sortText = "0193"
              },
              get_filter_text = "traversefunction(env, obj)",
              get_insert_text = "traversefunction",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "traversefunction(env, obj)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "traversefunction"
              },
              get_word = "traversefunction"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 584>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40572,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <585>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 585>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <586>{
          cache = {
            entries = {
              get_completion_item = <587>{
                data = {
                  id = 1802,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "traversestring",
                insertTextFormat = 2,
                kind = 3,
                label = "traversestring(env, obj)",
                sortText = "0194"
              },
              get_filter_text = "traversestring(env, obj)",
              get_insert_text = "traversestring",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "traversestring(env, obj)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "traversestring"
              },
              get_word = "traversestring"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 587>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40573,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <588>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 588>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <589>{
          cache = {
            entries = {
              get_completion_item = <590>{
                data = {
                  id = 1803,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "traversetable",
                insertTextFormat = 2,
                kind = 3,
                label = "traversetable(env, obj)",
                sortText = "0195"
              },
              get_filter_text = "traversetable(env, obj)",
              get_insert_text = "traversetable",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "traversetable(env, obj)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "traversetable"
              },
              get_word = "traversetable"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 590>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40574,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <591>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 591>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <592>{
          cache = {
            entries = {
              get_completion_item = <593>{
                data = {
                  id = 1804,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "traversethread",
                insertTextFormat = 2,
                kind = 3,
                label = "traversethread(env, t)",
                sortText = "0196"
              },
              get_filter_text = "traversethread(env, t)",
              get_insert_text = "traversethread",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "traversethread(env, t)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "traversethread"
              },
              get_word = "traversethread"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 593>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40575,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <594>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 594>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <595>{
          cache = {
            entries = {
              get_completion_item = <596>{
                data = {
                  id = 1805,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "traverseuserdata",
                insertTextFormat = 2,
                kind = 3,
                label = "traverseuserdata(env, obj)",
                sortText = "0197"
              },
              get_filter_text = "traverseuserdata(env, obj)",
              get_insert_text = "traverseuserdata",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "traverseuserdata(env, obj)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "traverseuserdata"
              },
              get_word = "traverseuserdata"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 596>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40576,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <597>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 597>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <598>{
          cache = {
            entries = {
              get_completion_item = <599>{
                data = {
                  id = 1806,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "type",
                insertTextFormat = 2,
                kind = 3,
                label = "type(v)",
                sortText = "0198"
              },
              get_filter_text = "type(v)",
              get_insert_text = "type",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "type(v)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "type"
              },
              get_word = "type"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 599>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40577,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <600>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 600>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <601>{
          cache = {
            entries = {
              get_completion_item = <602>{
                data = {
                  id = 1807,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "unmap",
                sortText = "0199"
              },
              get_filter_text = "unmap",
              get_insert_text = "unmap",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "unmap",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "unmap"
              },
              get_word = "unmap"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 602>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40578,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <603>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 603>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <604>{
          cache = {
            entries = {
              get_completion_item = <605>{
                data = {
                  id = 1808,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "unpack",
                insertTextFormat = 2,
                kind = 3,
                label = "unpack(list, i, j)",
                sortText = "0200"
              },
              get_filter_text = "unpack(list, i, j)",
              get_insert_text = "unpack",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "unpack(list, i, j)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "unpack"
              },
              get_word = "unpack"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 605>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40579,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <606>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 606>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <607>{
          cache = {
            entries = {
              get_completion_item = <608>{
                data = {
                  id = 1809,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "user",
                insertTextFormat = 2,
                kind = 3,
                label = "user(name, age, hobbies)",
                sortText = "0201"
              },
              get_filter_text = "user(name, age, hobbies)",
              get_insert_text = "user",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "user(name, age, hobbies)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "user"
              },
              get_word = "user"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 608>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40580,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <609>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 609>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <610>{
          cache = {
            entries = {
              get_completion_item = <611>{
                data = {
                  id = 1810,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "value",
                sortText = "0202"
              },
              get_filter_text = "value",
              get_insert_text = "value",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "value",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "value"
              },
              get_word = "value"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 611>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40581,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <612>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 612>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <613>{
          cache = {
            entries = {
              get_completion_item = <614>{
                data = {
                  id = 1811,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "vim",
                sortText = "0203"
              },
              get_filter_text = "vim",
              get_insert_text = "vim",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "vim",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "vim"
              },
              get_word = "vim"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 614>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40582,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <615>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 615>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <616>{
          cache = {
            entries = {
              get_completion_item = <617>{
                data = {
                  id = 1812,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "vmap",
                sortText = "0204"
              },
              get_filter_text = "vmap",
              get_insert_text = "vmap",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "vmap",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "vmap"
              },
              get_word = "vmap"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 617>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40583,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <618>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 618>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <619>{
          cache = {
            entries = {
              get_completion_item = <620>{
                data = {
                  id = 1813,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                deprecated = true,
                insertText = "warn",
                insertTextFormat = 2,
                kind = 3,
                label = "warn(message, ...)",
                sortText = "0205"
              },
              get_filter_text = "warn(message, ...)",
              get_insert_text = "warn",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "warn(message, ...)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "warn"
              },
              get_word = "warn"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 620>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40584,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <621>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 621>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <622>{
          cache = {
            entries = {
              get_completion_item = <623>{
                data = {
                  id = 1814,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 13,
                label = "what",
                sortText = "0206"
              },
              get_filter_text = "what",
              get_insert_text = "what",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "what",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "what"
              },
              get_word = "what"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 623>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40585,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <624>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 624>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <625>{
          cache = {
            entries = {
              get_completion_item = <626>{
                data = {
                  id = 1815,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "win_border",
                sortText = "0207"
              },
              get_filter_text = "win_border",
              get_insert_text = "win_border",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "win_border",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "win_border"
              },
              get_word = "win_border"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 626>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40586,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <627>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 627>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <628>{
          cache = {
            entries = {
              get_completion_item = <629>{
                data = {
                  id = 1816,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "win_text",
                sortText = "0208"
              },
              get_filter_text = "win_text",
              get_insert_text = "win_text",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "win_text",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "win_text"
              },
              get_word = "win_text"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 629>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40587,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <630>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 630>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <631>{
          cache = {
            entries = {
              get_completion_item = <632>{
                data = {
                  id = 1817,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 5,
                label = "xmap",
                sortText = "0209"
              },
              get_filter_text = "xmap",
              get_insert_text = "xmap",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "xmap",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "xmap"
              },
              get_word = "xmap"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 632>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40588,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <633>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 633>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <634>{
          cache = {
            entries = {
              get_completion_item = <635>{
                data = {
                  id = 1818,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertText = "xpcall",
                insertTextFormat = 2,
                kind = 3,
                label = "xpcall(f, msgh, arg1, ...)",
                sortText = "0210"
              },
              get_filter_text = "xpcall(f, msgh, arg1, ...)",
              get_insert_text = "xpcall",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "xpcall(f, msgh, arg1, ...)",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "xpcall"
              },
              get_word = "xpcall"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 635>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40589,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <636>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 636>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <637>{
          cache = {
            entries = {
              get_completion_item = <638>{
                command = {
                  arguments = { {
                      name = "require_dir",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/core/require_dir.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1819,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "require_dir",
                sortText = "0211"
              },
              get_filter_text = "require_dir",
              get_insert_text = "require_dir",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "require_dir",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "require_dir"
              },
              get_word = "require_dir"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 638>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40590,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <639>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 639>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <640>{
          cache = {
            entries = {
              get_completion_item = <641>{
                command = {
                  arguments = { {
                      name = "wrappers",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/core/wrappers.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1820,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "wrappers",
                sortText = "0212"
              },
              get_filter_text = "wrappers",
              get_insert_text = "wrappers",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "wrappers",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "wrappers"
              },
              get_word = "wrappers"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 641>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40591,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <642>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 642>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <643>{
          cache = {
            entries = {
              get_completion_item = <644>{
                command = {
                  arguments = { {
                      name = "first_load",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/first_load.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1821,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "first_load",
                sortText = "0213"
              },
              get_filter_text = "first_load",
              get_insert_text = "first_load",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "first_load",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "first_load"
              },
              get_word = "first_load"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 644>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40592,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <645>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 645>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <646>{
          cache = {
            entries = {
              get_completion_item = <647>{
                command = {
                  arguments = { {
                      name = "codelens",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/lsp/codelens.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1822,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "codelens",
                sortText = "0214"
              },
              get_filter_text = "codelens",
              get_insert_text = "codelens",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "codelens",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "codelens"
              },
              get_word = "codelens"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 647>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40593,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <648>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 648>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <649>{
          cache = {
            entries = {
              get_completion_item = <650>{
                command = {
                  arguments = { {
                      name = "handlers",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/lsp/handlers.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1823,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "handlers",
                sortText = "0215"
              },
              get_filter_text = "handlers",
              get_insert_text = "handlers",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "handlers",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "handlers"
              },
              get_word = "handlers"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 650>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40594,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <651>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 651>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <652>{
          cache = {
            entries = {
              get_completion_item = <653>{
                command = {
                  arguments = { {
                      name = "keymaps",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/lsp/keymaps.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1824,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "keymaps",
                sortText = "0216"
              },
              get_filter_text = "keymaps",
              get_insert_text = "keymaps",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "keymaps",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "keymaps"
              },
              get_word = "keymaps"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 653>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40595,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <654>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 654>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <655>{
          cache = {
            entries = {
              get_completion_item = <656>{
                command = {
                  arguments = { {
                      name = "jsonls",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/lsp/servers/jsonls.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1825,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "jsonls",
                sortText = "0217"
              },
              get_filter_text = "jsonls",
              get_insert_text = "jsonls",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "jsonls",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "jsonls"
              },
              get_word = "jsonls"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 656>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40596,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <657>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 657>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <658>{
          cache = {
            entries = {
              get_completion_item = <659>{
                command = {
                  arguments = { {
                      name = "pyright",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/lsp/servers/pyright.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1826,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "pyright",
                sortText = "0218"
              },
              get_filter_text = "pyright",
              get_insert_text = "pyright",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "pyright",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "pyright"
              },
              get_word = "pyright"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 659>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40597,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <660>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 660>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <661>{
          cache = {
            entries = {
              get_completion_item = <662>{
                command = {
                  arguments = { {
                      name = "python",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/lsp/servers/python.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1827,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "python",
                sortText = "0219"
              },
              get_filter_text = "python",
              get_insert_text = "python",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "python",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "python"
              },
              get_word = "python"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 662>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40598,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <663>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 663>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <664>{
          cache = {
            entries = {
              get_completion_item = <665>{
                command = {
                  arguments = { {
                      name = "sumneko_lua",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/lsp/servers/sumneko_lua.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1828,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "sumneko_lua",
                sortText = "0220"
              },
              get_filter_text = "sumneko_lua",
              get_insert_text = "sumneko_lua",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "sumneko_lua",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "sumneko_lua"
              },
              get_word = "sumneko_lua"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 665>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40599,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <666>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 666>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <667>{
          cache = {
            entries = {
              get_completion_item = <668>{
                command = {
                  arguments = { {
                      name = "show_message",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/lsp/show_message.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1829,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "show_message",
                sortText = "0221"
              },
              get_filter_text = "show_message",
              get_insert_text = "show_message",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "show_message",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "show_message"
              },
              get_word = "show_message"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 668>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40600,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <669>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 669>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <670>{
          cache = {
            entries = {
              get_completion_item = <671>{
                command = {
                  arguments = { {
                      name = "ascii_art",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/plugins/alpha/ascii_art.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1830,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "ascii_art",
                sortText = "0222"
              },
              get_filter_text = "ascii_art",
              get_insert_text = "ascii_art",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "ascii_art",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "ascii_art"
              },
              get_word = "ascii_art"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 671>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40601,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <672>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 672>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <673>{
          cache = {
            entries = {
              get_completion_item = <674>{
                command = {
                  arguments = { {
                      name = "dashboard",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/plugins/alpha/dashboard.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1831,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "dashboard",
                sortText = "0223"
              },
              get_filter_text = "dashboard",
              get_insert_text = "dashboard",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "dashboard",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "dashboard"
              },
              get_word = "dashboard"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 674>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40602,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <675>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 675>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <676>{
          cache = {
            entries = {
              get_completion_item = <677>{
                command = {
                  arguments = { {
                      name = "headers",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/plugins/alpha/headers.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1832,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "headers",
                sortText = "0224"
              },
              get_filter_text = "headers",
              get_insert_text = "headers",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "headers",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "headers"
              },
              get_word = "headers"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 677>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40603,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <678>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 678>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <679>{
          cache = {
            entries = {
              get_completion_item = <680>{
                command = {
                  arguments = { {
                      name = "multi_column",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/plugins/alpha/multi_column.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1833,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "multi_column",
                sortText = "0225"
              },
              get_filter_text = "multi_column",
              get_insert_text = "multi_column",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "multi_column",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "multi_column"
              },
              get_word = "multi_column"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 680>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40604,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <681>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 681>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <682>{
          cache = {
            entries = {
              get_completion_item = <683>{
                command = {
                  arguments = { {
                      name = "quotes",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/plugins/alpha/quotes.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1834,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "quotes",
                sortText = "0226"
              },
              get_filter_text = "quotes",
              get_insert_text = "quotes",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "quotes",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "quotes"
              },
              get_word = "quotes"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 683>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40605,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <684>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 684>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <685>{
          cache = {
            entries = {
              get_completion_item = <686>{
                command = {
                  arguments = { {
                      name = "startify",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/plugins/alpha/startify.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1835,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "startify",
                sortText = "0227"
              },
              get_filter_text = "startify",
              get_insert_text = "startify",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "startify",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "startify"
              },
              get_word = "startify"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 686>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40606,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <687>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 687>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <688>{
          cache = {
            entries = {
              get_completion_item = <689>{
                command = {
                  arguments = { {
                      name = "icons",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/plugins/cmp/icons.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1836,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "icons",
                sortText = "0228"
              },
              get_filter_text = "icons",
              get_insert_text = "icons",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "icons",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "icons"
              },
              get_word = "icons"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 689>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40607,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <690>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 690>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <691>{
          cache = {
            entries = {
              get_completion_item = <692>{
                command = {
                  arguments = { {
                      name = "database",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/plugins/database.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1837,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "database",
                sortText = "0229"
              },
              get_filter_text = "database",
              get_insert_text = "database",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "database",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "database"
              },
              get_word = "database"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 692>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40608,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <693>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 693>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <694>{
          cache = {
            entries = {
              get_completion_item = <695>{
                command = {
                  arguments = { {
                      name = "all",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/plugins/luasnip/ft/all.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1838,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "all",
                sortText = "0230"
              },
              get_filter_text = "all",
              get_insert_text = "all",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "all",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "all"
              },
              get_word = "all"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 695>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40609,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <696>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 696>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <697>{
          cache = {
            entries = {
              get_completion_item = <698>{
                command = {
                  arguments = { {
                      name = "lua",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/plugins/luasnip/ft/lua.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1839,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "lua",
                sortText = "0231"
              },
              get_filter_text = "lua",
              get_insert_text = "lua",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "lua",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "lua"
              },
              get_word = "lua"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 698>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40610,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <699>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 699>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <700>{
          cache = {
            entries = {
              get_completion_item = <701>{
                command = {
                  arguments = { {
                      name = "keymaps",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/plugins/telescope/keymaps.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1840,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "keymaps",
                sortText = "0232"
              },
              get_filter_text = "keymaps",
              get_insert_text = "keymaps",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "keymaps",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "keymaps"
              },
              get_word = "keymaps"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 701>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40611,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <702>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 702>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <703>{
          cache = {
            entries = {
              get_completion_item = <704>{
                command = {
                  arguments = { {
                      name = "mappings",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/plugins/tree/mappings.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1841,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "mappings",
                sortText = "0233"
              },
              get_filter_text = "mappings",
              get_insert_text = "mappings",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "mappings",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "mappings"
              },
              get_word = "mappings"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 704>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40612,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <705>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 705>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <706>{
          cache = {
            entries = {
              get_completion_item = <707>{
                command = {
                  arguments = { {
                      name = "options",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/plugins/tree/options.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1842,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "options",
                sortText = "0234"
              },
              get_filter_text = "options",
              get_insert_text = "options",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "options",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "options"
              },
              get_word = "options"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 707>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40613,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <708>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 708>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <709>{
          cache = {
            entries = {
              get_completion_item = <710>{
                command = {
                  arguments = { {
                      name = "class_component",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/statusline/class_component.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1843,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "class_component",
                sortText = "0235"
              },
              get_filter_text = "class_component",
              get_insert_text = "class_component",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "class_component",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "class_component"
              },
              get_word = "class_component"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 710>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40614,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <711>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 711>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <712>{
          cache = {
            entries = {
              get_completion_item = <713>{
                command = {
                  arguments = { {
                      name = "data",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/statusline/data.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1844,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "data",
                sortText = "0236"
              },
              get_filter_text = "data",
              get_insert_text = "data",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "data",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "data"
              },
              get_word = "data"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 713>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40615,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <714>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 714>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <715>{
          cache = {
            entries = {
              get_completion_item = <716>{
                command = {
                  arguments = { {
                      name = "helper_functions",
                      target = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/statusline/helper_functions.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1845,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "helper_functions",
                sortText = "0237"
              },
              get_filter_text = "helper_functions",
              get_insert_text = "helper_functions",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "helper_functions",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "helper_functions"
              },
              get_word = "helper_functions"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 716>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40616,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <717>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 717>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <718>{
          cache = {
            entries = {
              get_completion_item = <719>{
                command = {
                  arguments = { {
                      name = "luassert",
                      target = "file:///home/huy/.local/share/nvim/mason/packages/lua-language-server/extension/server/meta/3rd/luassert/library/luassert.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1846,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "luassert",
                sortText = "0238"
              },
              get_filter_text = "luassert",
              get_insert_text = "luassert",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "luassert",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "luassert"
              },
              get_word = "luassert"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 719>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40617,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <720>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 720>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <721>{
          cache = {
            entries = {
              get_completion_item = <722>{
                command = {
                  arguments = { {
                      name = "array",
                      target = "file:///home/huy/.local/share/nvim/mason/packages/lua-language-server/extension/server/meta/3rd/luassert/library/luassert/array.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1847,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "array",
                sortText = "0239"
              },
              get_filter_text = "array",
              get_insert_text = "array",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "array",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "array"
              },
              get_word = "array"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 722>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40618,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <723>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 723>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <724>{
          cache = {
            entries = {
              get_completion_item = <725>{
                command = {
                  arguments = { {
                      name = "mock",
                      target = "file:///home/huy/.local/share/nvim/mason/packages/lua-language-server/extension/server/meta/3rd/luassert/library/luassert/mock.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1848,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "mock",
                sortText = "0240"
              },
              get_filter_text = "mock",
              get_insert_text = "mock",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "mock",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "mock"
              },
              get_word = "mock"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 725>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40619,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <726>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 726>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <727>{
          cache = {
            entries = {
              get_completion_item = <728>{
                command = {
                  arguments = { {
                      name = "spy",
                      target = "file:///home/huy/.local/share/nvim/mason/packages/lua-language-server/extension/server/meta/3rd/luassert/library/luassert/spy.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1849,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "spy",
                sortText = "0241"
              },
              get_filter_text = "spy",
              get_insert_text = "spy",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "spy",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "spy"
              },
              get_word = "spy"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 728>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40620,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <729>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 729>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <730>{
          cache = {
            entries = {
              get_completion_item = <731>{
                command = {
                  arguments = { {
                      name = "stub",
                      target = "file:///home/huy/.local/share/nvim/mason/packages/lua-language-server/extension/server/meta/3rd/luassert/library/luassert/stub.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1850,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "stub",
                sortText = "0242"
              },
              get_filter_text = "stub",
              get_insert_text = "stub",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "stub",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "stub"
              },
              get_word = "stub"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 731>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40621,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <732>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 732>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <733>{
          cache = {
            entries = {
              get_completion_item = <734>{
                command = {
                  arguments = { {
                      name = "ffi",
                      target = "file:///home/huy/.local/share/nvim/mason/packages/lua-language-server/extension/server/meta/LuaJIT%20en-us%20utf8/ffi.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1851,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "ffi",
                sortText = "0243"
              },
              get_filter_text = "ffi",
              get_insert_text = "ffi",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "ffi",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "ffi"
              },
              get_word = "ffi"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 734>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40622,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <735>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 735>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <736>{
          cache = {
            entries = {
              get_completion_item = <737>{
                command = {
                  arguments = { {
                      name = "buffer",
                      target = "file:///home/huy/.local/share/nvim/mason/packages/lua-language-server/extension/server/meta/LuaJIT%20en-us%20utf8/string/buffer.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1852,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "buffer",
                sortText = "0244"
              },
              get_filter_text = "buffer",
              get_insert_text = "buffer",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "buffer",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "buffer"
              },
              get_word = "buffer"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 737>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40623,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <738>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 738>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <739>{
          cache = {
            entries = {
              get_completion_item = <740>{
                command = {
                  arguments = { {
                      name = "new",
                      target = "file:///home/huy/.local/share/nvim/mason/packages/lua-language-server/extension/server/meta/LuaJIT%20en-us%20utf8/table/new.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1853,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "new",
                sortText = "0245"
              },
              get_filter_text = "new",
              get_insert_text = "new",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "new",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "new"
              },
              get_word = "new"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 740>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40624,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <741>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 741>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <742>{
          cache = {
            entries = {
              get_completion_item = <743>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/adapters/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1854,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0246"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 743>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40625,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <744>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 744>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <745>{
          cache = {
            entries = {
              get_completion_item = <746>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/client/events/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1855,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0247"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 746>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40626,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <747>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 747>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <748>{
          cache = {
            entries = {
              get_completion_item = <749>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/client/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1856,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0248"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 749>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40627,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <750>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 750>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <751>{
          cache = {
            entries = {
              get_completion_item = <752>{
                command = {
                  arguments = { {
                      name = "runner",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/client/runner.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1857,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "runner",
                sortText = "0249"
              },
              get_filter_text = "runner",
              get_insert_text = "runner",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "runner",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "runner"
              },
              get_word = "runner"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 752>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40628,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <753>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 753>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <754>{
          cache = {
            entries = {
              get_completion_item = <755>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/client/state/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1858,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0250"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 755>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40629,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <756>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 756>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <757>{
          cache = {
            entries = {
              get_completion_item = <758>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/client/strategies/dap/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1859,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0251"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 758>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40630,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <759>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 759>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <760>{
          cache = {
            entries = {
              get_completion_item = <761>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/client/strategies/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1860,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0252"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 761>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40631,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <762>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 762>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <763>{
          cache = {
            entries = {
              get_completion_item = <764>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/client/strategies/integrated/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1861,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0253"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 764>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40632,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <765>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 765>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <766>{
          cache = {
            entries = {
              get_completion_item = <767>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/config/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1862,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0254"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 767>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40633,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <768>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 768>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <769>{
          cache = {
            entries = {
              get_completion_item = <770>{
                command = {
                  arguments = { {
                      name = "panel",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/consumers/output_panel/panel.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1863,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "panel",
                sortText = "0255"
              },
              get_filter_text = "panel",
              get_insert_text = "panel",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "panel",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "panel"
              },
              get_word = "panel"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 770>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40634,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <771>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 771>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <772>{
          cache = {
            entries = {
              get_completion_item = <773>{
                command = {
                  arguments = { {
                      name = "canvas",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/consumers/summary/canvas.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1864,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "canvas",
                sortText = "0256"
              },
              get_filter_text = "canvas",
              get_insert_text = "canvas",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "canvas",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "canvas"
              },
              get_word = "canvas"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 773>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40635,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <774>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 774>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <775>{
          cache = {
            entries = {
              get_completion_item = <776>{
                command = {
                  arguments = { {
                      name = "component",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/consumers/summary/component.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1865,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "component",
                sortText = "0257"
              },
              get_filter_text = "component",
              get_insert_text = "component",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "component",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "component"
              },
              get_word = "component"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 776>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40636,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <777>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 777>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <778>{
          cache = {
            entries = {
              get_completion_item = <779>{
                command = {
                  arguments = { {
                      name = "summary",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/consumers/summary/summary.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1866,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "summary",
                sortText = "0258"
              },
              get_filter_text = "summary",
              get_insert_text = "summary",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "summary",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "summary"
              },
              get_word = "summary"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 779>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40637,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <780>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 780>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <781>{
          cache = {
            entries = {
              get_completion_item = <782>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1867,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0259"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 782>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40638,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <783>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 783>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <784>{
          cache = {
            entries = {
              get_completion_item = <785>{
                command = {
                  arguments = { {
                      name = "find",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/lib/file/find.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1868,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "find",
                sortText = "0260"
              },
              get_filter_text = "find",
              get_insert_text = "find",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "find",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "find"
              },
              get_word = "find"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 785>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40639,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <786>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 786>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <787>{
          cache = {
            entries = {
              get_completion_item = <788>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/lib/file/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1869,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0261"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 788>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40640,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <789>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 789>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <790>{
          cache = {
            entries = {
              get_completion_item = <791>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/lib/func_util/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1870,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0262"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 791>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40641,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <792>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 792>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <793>{
          cache = {
            entries = {
              get_completion_item = <794>{
                command = {
                  arguments = { {
                      name = "memoize",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/lib/func_util/memoize.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1871,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "memoize",
                sortText = "0263"
              },
              get_filter_text = "memoize",
              get_insert_text = "memoize",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "memoize",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "memoize"
              },
              get_word = "memoize"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 794>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40642,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <795>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 795>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <796>{
          cache = {
            entries = {
              get_completion_item = <797>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/lib/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1872,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0264"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 797>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40643,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <798>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 798>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <799>{
          cache = {
            entries = {
              get_completion_item = <800>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/lib/positions/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1873,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0265"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 800>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40644,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <801>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 801>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <802>{
          cache = {
            entries = {
              get_completion_item = <803>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/lib/process/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1874,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0266"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 803>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40645,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <804>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 804>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <805>{
          cache = {
            entries = {
              get_completion_item = <806>{
                command = {
                  arguments = { {
                      name = "subprocess",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/lib/subprocess.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1875,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "subprocess",
                sortText = "0267"
              },
              get_filter_text = "subprocess",
              get_insert_text = "subprocess",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "subprocess",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "subprocess"
              },
              get_word = "subprocess"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 806>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40646,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <807>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 807>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <808>{
          cache = {
            entries = {
              get_completion_item = <809>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/lib/treesitter/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1876,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0268"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 809>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40647,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <810>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 810>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <811>{
          cache = {
            entries = {
              get_completion_item = <812>{
                command = {
                  arguments = { {
                      name = "float",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/lib/ui/float.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1877,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "float",
                sortText = "0269"
              },
              get_filter_text = "float",
              get_insert_text = "float",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "float",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "float"
              },
              get_word = "float"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 812>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40648,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <813>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 813>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <814>{
          cache = {
            entries = {
              get_completion_item = <815>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/lib/ui/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1878,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0270"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 815>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40649,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <816>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 816>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <817>{
          cache = {
            entries = {
              get_completion_item = <818>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/lib/vim_test/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1879,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0271"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 818>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40650,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <819>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 819>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <820>{
          cache = {
            entries = {
              get_completion_item = <821>{
                command = {
                  arguments = { {
                      name = "window",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/lib/window.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1880,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "window",
                sortText = "0272"
              },
              get_filter_text = "window",
              get_insert_text = "window",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "window",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "window"
              },
              get_word = "window"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 821>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40651,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <822>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 822>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <823>{
          cache = {
            entries = {
              get_completion_item = <824>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/lib/xml/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1881,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0273"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 824>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40652,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <825>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 825>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <826>{
          cache = {
            entries = {
              get_completion_item = <827>{
                command = {
                  arguments = { {
                      name = "parser",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/lib/xml/parser.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1882,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "parser",
                sortText = "0274"
              },
              get_filter_text = "parser",
              get_insert_text = "parser",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "parser",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "parser"
              },
              get_word = "parser"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 827>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40653,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <828>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 828>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <829>{
          cache = {
            entries = {
              get_completion_item = <830>{
                command = {
                  arguments = { {
                      name = "tree",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/lib/xml/tree.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1883,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "tree",
                sortText = "0275"
              },
              get_filter_text = "tree",
              get_insert_text = "tree",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "tree",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "tree"
              },
              get_word = "tree"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 830>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40654,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <831>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 831>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <832>{
          cache = {
            entries = {
              get_completion_item = <833>{
                command = {
                  arguments = { {
                      name = "fanout_accum",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/types/fanout_accum.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1884,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "fanout_accum",
                sortText = "0276"
              },
              get_filter_text = "fanout_accum",
              get_insert_text = "fanout_accum",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "fanout_accum",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "fanout_accum"
              },
              get_word = "fanout_accum"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 833>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40655,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <834>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 834>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <835>{
          cache = {
            entries = {
              get_completion_item = <836>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/types/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1885,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0277"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 836>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40656,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <837>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 837>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <838>{
          cache = {
            entries = {
              get_completion_item = <839>{
                command = {
                  arguments = { {
                      name = "tree",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/neotest/lua/neotest/types/tree.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1886,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "tree",
                sortText = "0278"
              },
              get_filter_text = "tree",
              get_insert_text = "tree",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "tree",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "tree"
              },
              get_word = "tree"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 839>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40657,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <840>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 840>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <841>{
          cache = {
            entries = {
              get_completion_item = <842>{
                command = {
                  arguments = { {
                      name = "caching",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/nvim-treesitter/lua/nvim-treesitter/caching.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1887,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "caching",
                sortText = "0279"
              },
              get_filter_text = "caching",
              get_insert_text = "caching",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "caching",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "caching"
              },
              get_word = "caching"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 842>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40658,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <843>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 843>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <844>{
          cache = {
            entries = {
              get_completion_item = <845>{
                command = {
                  arguments = { {
                      name = "configs",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/nvim-treesitter/lua/nvim-treesitter/configs.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1888,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "configs",
                sortText = "0280"
              },
              get_filter_text = "configs",
              get_insert_text = "configs",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "configs",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "configs"
              },
              get_word = "configs"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 845>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40659,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <846>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 846>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <847>{
          cache = {
            entries = {
              get_completion_item = <848>{
                command = {
                  arguments = { {
                      name = "fold",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/nvim-treesitter/lua/nvim-treesitter/fold.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1889,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "fold",
                sortText = "0281"
              },
              get_filter_text = "fold",
              get_insert_text = "fold",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "fold",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "fold"
              },
              get_word = "fold"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 848>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40660,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <849>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 849>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <850>{
          cache = {
            entries = {
              get_completion_item = <851>{
                command = {
                  arguments = { {
                      name = "health",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/nvim-treesitter/lua/nvim-treesitter/health.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1890,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "health",
                sortText = "0282"
              },
              get_filter_text = "health",
              get_insert_text = "health",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "health",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "health"
              },
              get_word = "health"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 851>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40661,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <852>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 852>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <853>{
          cache = {
            entries = {
              get_completion_item = <854>{
                command = {
                  arguments = { {
                      name = "highlight",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/nvim-treesitter/lua/nvim-treesitter/highlight.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1891,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "highlight",
                sortText = "0283"
              },
              get_filter_text = "highlight",
              get_insert_text = "highlight",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "highlight",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "highlight"
              },
              get_word = "highlight"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 854>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40662,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <855>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 855>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <856>{
          cache = {
            entries = {
              get_completion_item = <857>{
                command = {
                  arguments = { {
                      name = "incremental_selection",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/nvim-treesitter/lua/nvim-treesitter/incremental_selection.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1892,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "incremental_selection",
                sortText = "0284"
              },
              get_filter_text = "incremental_selection",
              get_insert_text = "incremental_selection",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "incremental_selection",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "incremental_selection"
              },
              get_word = "incremental_selection"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 857>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40663,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <858>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 858>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <859>{
          cache = {
            entries = {
              get_completion_item = <860>{
                command = {
                  arguments = { {
                      name = "indent",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/nvim-treesitter/lua/nvim-treesitter/indent.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1893,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "indent",
                sortText = "0285"
              },
              get_filter_text = "indent",
              get_insert_text = "indent",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "indent",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "indent"
              },
              get_word = "indent"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 860>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40664,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <861>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 861>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <862>{
          cache = {
            entries = {
              get_completion_item = <863>{
                command = {
                  arguments = { {
                      name = "info",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/nvim-treesitter/lua/nvim-treesitter/info.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1894,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "info",
                sortText = "0286"
              },
              get_filter_text = "info",
              get_insert_text = "info",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "info",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "info"
              },
              get_word = "info"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 863>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40665,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <864>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 864>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <865>{
          cache = {
            entries = {
              get_completion_item = <866>{
                command = {
                  arguments = { {
                      name = "install",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/nvim-treesitter/lua/nvim-treesitter/install.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1895,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "install",
                sortText = "0287"
              },
              get_filter_text = "install",
              get_insert_text = "install",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "install",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "install"
              },
              get_word = "install"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 866>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40666,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <867>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 867>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <868>{
          cache = {
            entries = {
              get_completion_item = <869>{
                command = {
                  arguments = { {
                      name = "locals",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/nvim-treesitter/lua/nvim-treesitter/locals.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1896,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "locals",
                sortText = "0288"
              },
              get_filter_text = "locals",
              get_insert_text = "locals",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "locals",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "locals"
              },
              get_word = "locals"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 869>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40667,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <870>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 870>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <871>{
          cache = {
            entries = {
              get_completion_item = <872>{
                command = {
                  arguments = { {
                      name = "parsers",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/nvim-treesitter/lua/nvim-treesitter/parsers.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1897,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "parsers",
                sortText = "0289"
              },
              get_filter_text = "parsers",
              get_insert_text = "parsers",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "parsers",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "parsers"
              },
              get_word = "parsers"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 872>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40668,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <873>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 873>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <874>{
          cache = {
            entries = {
              get_completion_item = <875>{
                command = {
                  arguments = { {
                      name = "query",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/nvim-treesitter/lua/nvim-treesitter/query.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1898,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "query",
                sortText = "0290"
              },
              get_filter_text = "query",
              get_insert_text = "query",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "query",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "query"
              },
              get_word = "query"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 875>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40669,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <876>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 876>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <877>{
          cache = {
            entries = {
              get_completion_item = <878>{
                command = {
                  arguments = { {
                      name = "shell_command_selectors",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/nvim-treesitter/lua/nvim-treesitter/shell_command_selectors.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1899,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "shell_command_selectors",
                sortText = "0291"
              },
              get_filter_text = "shell_command_selectors",
              get_insert_text = "shell_command_selectors",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "shell_command_selectors",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "shell_command_selectors"
              },
              get_word = "shell_command_selectors"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 878>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40670,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <879>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 879>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <880>{
          cache = {
            entries = {
              get_completion_item = <881>{
                command = {
                  arguments = { {
                      name = "statusline",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/nvim-treesitter/lua/nvim-treesitter/statusline.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1900,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "statusline",
                sortText = "0292"
              },
              get_filter_text = "statusline",
              get_insert_text = "statusline",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "statusline",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "statusline"
              },
              get_word = "statusline"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 881>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40671,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <882>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 882>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <883>{
          cache = {
            entries = {
              get_completion_item = <884>{
                command = {
                  arguments = { {
                      name = "ts_utils",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/nvim-treesitter/lua/nvim-treesitter/ts_utils.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1901,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "ts_utils",
                sortText = "0293"
              },
              get_filter_text = "ts_utils",
              get_insert_text = "ts_utils",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "ts_utils",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "ts_utils"
              },
              get_word = "ts_utils"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 884>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40672,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <885>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 885>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <886>{
          cache = {
            entries = {
              get_completion_item = <887>{
                command = {
                  arguments = { {
                      name = "tsrange",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/nvim-treesitter/lua/nvim-treesitter/tsrange.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1902,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "tsrange",
                sortText = "0294"
              },
              get_filter_text = "tsrange",
              get_insert_text = "tsrange",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "tsrange",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "tsrange"
              },
              get_word = "tsrange"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 887>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40673,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <888>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 888>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <889>{
          cache = {
            entries = {
              get_completion_item = <890>{
                command = {
                  arguments = { {
                      name = "utils",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/nvim-treesitter/lua/nvim-treesitter/utils.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1903,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "utils",
                sortText = "0295"
              },
              get_filter_text = "utils",
              get_insert_text = "utils",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "utils",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "utils"
              },
              get_word = "utils"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 890>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40674,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <891>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 891>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <892>{
          cache = {
            entries = {
              get_completion_item = <893>{
                command = {
                  arguments = { {
                      name = "common",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/nvim-treesitter/tests/indent/common.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1904,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "common",
                sortText = "0296"
              },
              get_filter_text = "common",
              get_insert_text = "common",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "common",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "common"
              },
              get_word = "common"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 893>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40675,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <894>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 894>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <895>{
          cache = {
            entries = {
              get_completion_item = <896>{
                command = {
                  arguments = { {
                      name = "base",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/data/plenary/filetypes/base.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1905,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "base",
                sortText = "0297"
              },
              get_filter_text = "base",
              get_insert_text = "base",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "base",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "base"
              },
              get_word = "base"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 896>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40676,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <897>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 897>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <898>{
          cache = {
            entries = {
              get_completion_item = <899>{
                command = {
                  arguments = { {
                      name = "builtin",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/data/plenary/filetypes/builtin.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1906,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "builtin",
                sortText = "0298"
              },
              get_filter_text = "builtin",
              get_insert_text = "builtin",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "builtin",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "builtin"
              },
              get_word = "builtin"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 899>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40677,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <900>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 900>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <901>{
          cache = {
            entries = {
              get_completion_item = <902>{
                command = {
                  arguments = { {
                      name = "compatibility",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/luassert/compatibility.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1907,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "compatibility",
                sortText = "0299"
              },
              get_filter_text = "compatibility",
              get_insert_text = "compatibility",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "compatibility",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "compatibility"
              },
              get_word = "compatibility"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 902>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40678,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <903>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 903>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <904>{
          cache = {
            entries = {
              get_completion_item = <905>{
                command = {
                  arguments = { {
                      name = "binarystring",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/luassert/formatters/binarystring.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1908,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "binarystring",
                sortText = "0300"
              },
              get_filter_text = "binarystring",
              get_insert_text = "binarystring",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "binarystring",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "binarystring"
              },
              get_word = "binarystring"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 905>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40679,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <906>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 906>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <907>{
          cache = {
            entries = {
              get_completion_item = <908>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/luassert/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1909,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0301"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 908>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40680,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <909>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 909>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <910>{
          cache = {
            entries = {
              get_completion_item = <911>{
                command = {
                  arguments = { {
                      name = "namespaces",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/luassert/namespaces.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1910,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "namespaces",
                sortText = "0302"
              },
              get_filter_text = "namespaces",
              get_insert_text = "namespaces",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "namespaces",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "namespaces"
              },
              get_word = "namespaces"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 911>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40681,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <912>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 912>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <913>{
          cache = {
            entries = {
              get_completion_item = <914>{
                command = {
                  arguments = { {
                      name = "state",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/luassert/state.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1911,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "state",
                sortText = "0303"
              },
              get_filter_text = "state",
              get_insert_text = "state",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "state",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "state"
              },
              get_word = "state"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 914>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40682,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <915>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 915>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <916>{
          cache = {
            entries = {
              get_completion_item = <917>{
                command = {
                  arguments = { {
                      name = "util",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/luassert/util.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1912,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "util",
                sortText = "0304"
              },
              get_filter_text = "util",
              get_insert_text = "util",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "util",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "util"
              },
              get_word = "util"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 917>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40683,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <918>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 918>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <919>{
          cache = {
            entries = {
              get_completion_item = <920>{
                command = {
                  arguments = { {
                      name = "control",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/async/control.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1913,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "control",
                sortText = "0305"
              },
              get_filter_text = "control",
              get_insert_text = "control",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "control",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "control"
              },
              get_word = "control"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 920>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40684,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <921>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 921>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <922>{
          cache = {
            entries = {
              get_completion_item = <923>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/async/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1914,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0306"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 923>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40685,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <924>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 924>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <925>{
          cache = {
            entries = {
              get_completion_item = <926>{
                command = {
                  arguments = { {
                      name = "lsp",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/async/lsp.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1915,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "lsp",
                sortText = "0307"
              },
              get_filter_text = "lsp",
              get_insert_text = "lsp",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "lsp",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "lsp"
              },
              get_word = "lsp"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 926>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40686,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <927>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 927>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <928>{
          cache = {
            entries = {
              get_completion_item = <929>{
                command = {
                  arguments = { {
                      name = "structs",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/async/structs.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1916,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "structs",
                sortText = "0308"
              },
              get_filter_text = "structs",
              get_insert_text = "structs",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "structs",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "structs"
              },
              get_word = "structs"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 929>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40687,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <930>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 930>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <931>{
          cache = {
            entries = {
              get_completion_item = <932>{
                command = {
                  arguments = { {
                      name = "tests",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/async/tests.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1917,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "tests",
                sortText = "0309"
              },
              get_filter_text = "tests",
              get_insert_text = "tests",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "tests",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "tests"
              },
              get_word = "tests"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 932>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40688,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <933>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 933>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <934>{
          cache = {
            entries = {
              get_completion_item = <935>{
                command = {
                  arguments = { {
                      name = "util",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/async/util.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1918,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "util",
                sortText = "0310"
              },
              get_filter_text = "util",
              get_insert_text = "util",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "util",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "util"
              },
              get_word = "util"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 935>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40689,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <936>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 936>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <937>{
          cache = {
            entries = {
              get_completion_item = <938>{
                command = {
                  arguments = { {
                      name = "uv_async",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/async/uv_async.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1919,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "uv_async",
                sortText = "0311"
              },
              get_filter_text = "uv_async",
              get_insert_text = "uv_async",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "uv_async",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "uv_async"
              },
              get_word = "uv_async"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 938>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40690,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <939>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 939>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <940>{
          cache = {
            entries = {
              get_completion_item = <941>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/async_lib/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1920,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0312"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 941>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40691,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <942>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 942>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <943>{
          cache = {
            entries = {
              get_completion_item = <944>{
                command = {
                  arguments = { {
                      name = "lsp",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/async_lib/lsp.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1921,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "lsp",
                sortText = "0313"
              },
              get_filter_text = "lsp",
              get_insert_text = "lsp",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "lsp",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "lsp"
              },
              get_word = "lsp"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 944>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40692,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <945>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 945>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <946>{
          cache = {
            entries = {
              get_completion_item = <947>{
                command = {
                  arguments = { {
                      name = "structs",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/async_lib/structs.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1922,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "structs",
                sortText = "0314"
              },
              get_filter_text = "structs",
              get_insert_text = "structs",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "structs",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "structs"
              },
              get_word = "structs"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 947>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40693,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <948>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 948>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <949>{
          cache = {
            entries = {
              get_completion_item = <950>{
                command = {
                  arguments = { {
                      name = "tests",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/async_lib/tests.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1923,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "tests",
                sortText = "0315"
              },
              get_filter_text = "tests",
              get_insert_text = "tests",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "tests",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "tests"
              },
              get_word = "tests"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 950>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40694,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <951>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 951>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <952>{
          cache = {
            entries = {
              get_completion_item = <953>{
                command = {
                  arguments = { {
                      name = "util",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/async_lib/util.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1924,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "util",
                sortText = "0316"
              },
              get_filter_text = "util",
              get_insert_text = "util",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "util",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "util"
              },
              get_word = "util"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 953>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40695,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <954>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 954>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <955>{
          cache = {
            entries = {
              get_completion_item = <956>{
                command = {
                  arguments = { {
                      name = "uv_async",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/async_lib/uv_async.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1925,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "uv_async",
                sortText = "0317"
              },
              get_filter_text = "uv_async",
              get_insert_text = "uv_async",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "uv_async",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "uv_async"
              },
              get_word = "uv_async"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 956>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40696,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <957>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 957>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <958>{
          cache = {
            entries = {
              get_completion_item = <959>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/benchmark/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1926,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0318"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 959>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40697,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <960>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 960>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <961>{
          cache = {
            entries = {
              get_completion_item = <962>{
                command = {
                  arguments = { {
                      name = "busted",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/busted.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1927,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "busted",
                sortText = "0319"
              },
              get_filter_text = "busted",
              get_insert_text = "busted",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "busted",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "busted"
              },
              get_word = "busted"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 962>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40698,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <963>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 963>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <964>{
          cache = {
            entries = {
              get_completion_item = <965>{
                command = {
                  arguments = { {
                      name = "class",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/class.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1928,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "class",
                sortText = "0320"
              },
              get_filter_text = "class",
              get_insert_text = "class",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "class",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "class"
              },
              get_word = "class"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 965>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40699,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <966>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 966>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <967>{
          cache = {
            entries = {
              get_completion_item = <968>{
                command = {
                  arguments = { {
                      name = "context_manager",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/context_manager.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1929,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "context_manager",
                sortText = "0321"
              },
              get_filter_text = "context_manager",
              get_insert_text = "context_manager",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "context_manager",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "context_manager"
              },
              get_word = "context_manager"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 968>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40700,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <969>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 969>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <970>{
          cache = {
            entries = {
              get_completion_item = <971>{
                command = {
                  arguments = { {
                      name = "debug_utils",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/debug_utils.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1930,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "debug_utils",
                sortText = "0322"
              },
              get_filter_text = "debug_utils",
              get_insert_text = "debug_utils",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "debug_utils",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "debug_utils"
              },
              get_word = "debug_utils"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 971>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40701,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <972>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 972>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <973>{
          cache = {
            entries = {
              get_completion_item = <974>{
                command = {
                  arguments = { {
                      name = "errors",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/errors.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1931,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "errors",
                sortText = "0323"
              },
              get_filter_text = "errors",
              get_insert_text = "errors",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "errors",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "errors"
              },
              get_word = "errors"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 974>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40702,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <975>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 975>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <976>{
          cache = {
            entries = {
              get_completion_item = <977>{
                command = {
                  arguments = { {
                      name = "filetype",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/filetype.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1932,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "filetype",
                sortText = "0324"
              },
              get_filter_text = "filetype",
              get_insert_text = "filetype",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "filetype",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "filetype"
              },
              get_word = "filetype"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 977>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40703,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <978>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 978>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <979>{
          cache = {
            entries = {
              get_completion_item = <980>{
                command = {
                  arguments = { {
                      name = "fun",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/fun.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1933,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "fun",
                sortText = "0325"
              },
              get_filter_text = "fun",
              get_insert_text = "fun",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "fun",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "fun"
              },
              get_word = "fun"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 980>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40704,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <981>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 981>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <982>{
          cache = {
            entries = {
              get_completion_item = <983>{
                command = {
                  arguments = { {
                      name = "functional",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/functional.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1934,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "functional",
                sortText = "0326"
              },
              get_filter_text = "functional",
              get_insert_text = "functional",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "functional",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "functional"
              },
              get_word = "functional"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 983>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40705,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <984>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 984>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <985>{
          cache = {
            entries = {
              get_completion_item = <986>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1935,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0327"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 986>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40706,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <987>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 987>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <988>{
          cache = {
            entries = {
              get_completion_item = <989>{
                command = {
                  arguments = { {
                      name = "iterators",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/iterators.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1936,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "iterators",
                sortText = "0328"
              },
              get_filter_text = "iterators",
              get_insert_text = "iterators",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "iterators",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "iterators"
              },
              get_word = "iterators"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 989>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40707,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <990>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 990>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <991>{
          cache = {
            entries = {
              get_completion_item = <992>{
                command = {
                  arguments = { {
                      name = "job",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/job.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1937,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "job",
                sortText = "0329"
              },
              get_filter_text = "job",
              get_insert_text = "job",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "job",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "job"
              },
              get_word = "job"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 992>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40708,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <993>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 993>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <994>{
          cache = {
            entries = {
              get_completion_item = <995>{
                command = {
                  arguments = { {
                      name = "json",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/json.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1938,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "json",
                sortText = "0330"
              },
              get_filter_text = "json",
              get_insert_text = "json",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "json",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "json"
              },
              get_word = "json"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 995>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40709,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <996>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 996>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <997>{
          cache = {
            entries = {
              get_completion_item = <998>{
                command = {
                  arguments = { {
                      name = "log",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/log.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1939,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "log",
                sortText = "0331"
              },
              get_filter_text = "log",
              get_insert_text = "log",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "log",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "log"
              },
              get_word = "log"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 998>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40710,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <999>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 999>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1000>{
          cache = {
            entries = {
              get_completion_item = <1001>{
                command = {
                  arguments = { {
                      name = "override",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/lsp/override.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1940,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "override",
                sortText = "0332"
              },
              get_filter_text = "override",
              get_insert_text = "override",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "override",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "override"
              },
              get_word = "override"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1001>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40711,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1002>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1002>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1003>{
          cache = {
            entries = {
              get_completion_item = <1004>{
                command = {
                  arguments = { {
                      name = "nvim_meta",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/nvim_meta.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1941,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "nvim_meta",
                sortText = "0333"
              },
              get_filter_text = "nvim_meta",
              get_insert_text = "nvim_meta",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "nvim_meta",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "nvim_meta"
              },
              get_word = "nvim_meta"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1004>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40712,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1005>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1005>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1006>{
          cache = {
            entries = {
              get_completion_item = <1007>{
                command = {
                  arguments = { {
                      name = "operators",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/operators.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1942,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "operators",
                sortText = "0334"
              },
              get_filter_text = "operators",
              get_insert_text = "operators",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "operators",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "operators"
              },
              get_word = "operators"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1007>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40713,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1008>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1008>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1009>{
          cache = {
            entries = {
              get_completion_item = <1010>{
                command = {
                  arguments = { {
                      name = "path",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/path.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1943,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "path",
                sortText = "0335"
              },
              get_filter_text = "path",
              get_insert_text = "path",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "path",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "path"
              },
              get_word = "path"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1010>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40714,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1011>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1011>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1012>{
          cache = {
            entries = {
              get_completion_item = <1013>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/popup/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1944,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0336"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1013>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40715,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1014>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1014>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1015>{
          cache = {
            entries = {
              get_completion_item = <1016>{
                command = {
                  arguments = { {
                      name = "utils",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/popup/utils.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1945,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "utils",
                sortText = "0337"
              },
              get_filter_text = "utils",
              get_insert_text = "utils",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "utils",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "utils"
              },
              get_word = "utils"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1016>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40716,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1017>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1017>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1018>{
          cache = {
            entries = {
              get_completion_item = <1019>{
                command = {
                  arguments = { {
                      name = "profile",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/profile.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1946,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "profile",
                sortText = "0338"
              },
              get_filter_text = "profile",
              get_insert_text = "profile",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "profile",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "profile"
              },
              get_word = "profile"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1019>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40717,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1020>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1020>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1021>{
          cache = {
            entries = {
              get_completion_item = <1022>{
                command = {
                  arguments = { {
                      name = "lua_profiler",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/profile/lua_profiler.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1947,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "lua_profiler",
                sortText = "0339"
              },
              get_filter_text = "lua_profiler",
              get_insert_text = "lua_profiler",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "lua_profiler",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "lua_profiler"
              },
              get_word = "lua_profiler"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1022>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40718,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1023>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1023>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1024>{
          cache = {
            entries = {
              get_completion_item = <1025>{
                command = {
                  arguments = { {
                      name = "memory_profiler",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/profile/memory_profiler.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1948,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "memory_profiler",
                sortText = "0340"
              },
              get_filter_text = "memory_profiler",
              get_insert_text = "memory_profiler",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "memory_profiler",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "memory_profiler"
              },
              get_word = "memory_profiler"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1025>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40719,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1026>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1026>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1027>{
          cache = {
            entries = {
              get_completion_item = <1028>{
                command = {
                  arguments = { {
                      name = "p",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/profile/p.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1949,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "p",
                sortText = "0341"
              },
              get_filter_text = "p",
              get_insert_text = "p",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "p",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "p"
              },
              get_word = "p"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1028>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40720,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1029>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1029>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1030>{
          cache = {
            entries = {
              get_completion_item = <1031>{
                command = {
                  arguments = { {
                      name = "reload",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/reload.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1950,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "reload",
                sortText = "0342"
              },
              get_filter_text = "reload",
              get_insert_text = "reload",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "reload",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "reload"
              },
              get_word = "reload"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1031>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40721,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1032>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1032>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1033>{
          cache = {
            entries = {
              get_completion_item = <1034>{
                command = {
                  arguments = { {
                      name = "run",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/run.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1951,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "run",
                sortText = "0343"
              },
              get_filter_text = "run",
              get_insert_text = "run",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "run",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "run"
              },
              get_word = "run"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1034>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40722,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1035>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1035>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1036>{
          cache = {
            entries = {
              get_completion_item = <1037>{
                command = {
                  arguments = { {
                      name = "scandir",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/scandir.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1952,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "scandir",
                sortText = "0344"
              },
              get_filter_text = "scandir",
              get_insert_text = "scandir",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "scandir",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "scandir"
              },
              get_word = "scandir"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1037>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40723,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1038>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1038>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1039>{
          cache = {
            entries = {
              get_completion_item = <1040>{
                command = {
                  arguments = { {
                      name = "strings",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/strings.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1953,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "strings",
                sortText = "0345"
              },
              get_filter_text = "strings",
              get_insert_text = "strings",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "strings",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "strings"
              },
              get_word = "strings"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1040>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40724,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1041>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1041>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1042>{
          cache = {
            entries = {
              get_completion_item = <1043>{
                command = {
                  arguments = { {
                      name = "tbl",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/tbl.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1954,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "tbl",
                sortText = "0346"
              },
              get_filter_text = "tbl",
              get_insert_text = "tbl",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "tbl",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "tbl"
              },
              get_word = "tbl"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1043>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40725,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1044>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1044>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1045>{
          cache = {
            entries = {
              get_completion_item = <1046>{
                command = {
                  arguments = { {
                      name = "test_harness",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/test_harness.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1955,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "test_harness",
                sortText = "0347"
              },
              get_filter_text = "test_harness",
              get_insert_text = "test_harness",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "test_harness",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "test_harness"
              },
              get_word = "test_harness"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1046>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40726,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1047>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1047>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1048>{
          cache = {
            entries = {
              get_completion_item = <1049>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/vararg/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1956,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0348"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1049>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40727,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1050>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1050>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1051>{
          cache = {
            entries = {
              get_completion_item = <1052>{
                command = {
                  arguments = { {
                      name = "rotate",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/vararg/rotate.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1957,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "rotate",
                sortText = "0349"
              },
              get_filter_text = "rotate",
              get_insert_text = "rotate",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "rotate",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "rotate"
              },
              get_word = "rotate"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1052>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40728,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1053>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1053>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1054>{
          cache = {
            entries = {
              get_completion_item = <1055>{
                command = {
                  arguments = { {
                      name = "border",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/window/border.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1958,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "border",
                sortText = "0350"
              },
              get_filter_text = "border",
              get_insert_text = "border",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "border",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "border"
              },
              get_word = "border"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1055>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40729,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1056>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1056>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1057>{
          cache = {
            entries = {
              get_completion_item = <1058>{
                command = {
                  arguments = { {
                      name = "float",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/window/float.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1959,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "float",
                sortText = "0351"
              },
              get_filter_text = "float",
              get_insert_text = "float",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "float",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "float"
              },
              get_word = "float"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1058>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40730,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1059>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1059>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1060>{
          cache = {
            entries = {
              get_completion_item = <1061>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/window/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1960,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0352"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1061>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40731,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1062>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1062>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1063>{
          cache = {
            entries = {
              get_completion_item = <1064>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/_extensions/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1961,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0353"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1064>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40732,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1065>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1065>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1066>{
          cache = {
            entries = {
              get_completion_item = <1067>{
                command = {
                  arguments = { {
                      name = "generate",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/actions/generate.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1962,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "generate",
                sortText = "0354"
              },
              get_filter_text = "generate",
              get_insert_text = "generate",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "generate",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "generate"
              },
              get_word = "generate"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1067>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40733,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1068>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1068>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1069>{
          cache = {
            entries = {
              get_completion_item = <1070>{
                command = {
                  arguments = { {
                      name = "history",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/actions/history.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1963,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "history",
                sortText = "0355"
              },
              get_filter_text = "history",
              get_insert_text = "history",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "history",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "history"
              },
              get_word = "history"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1070>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40734,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1071>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1071>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1072>{
          cache = {
            entries = {
              get_completion_item = <1073>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/actions/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1964,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0356"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1073>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40735,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1074>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1074>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1075>{
          cache = {
            entries = {
              get_completion_item = <1076>{
                command = {
                  arguments = { {
                      name = "layout",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/actions/layout.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1965,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "layout",
                sortText = "0357"
              },
              get_filter_text = "layout",
              get_insert_text = "layout",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "layout",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "layout"
              },
              get_word = "layout"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1076>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40736,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1077>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1077>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1078>{
          cache = {
            entries = {
              get_completion_item = <1079>{
                command = {
                  arguments = { {
                      name = "mt",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/actions/mt.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1966,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "mt",
                sortText = "0358"
              },
              get_filter_text = "mt",
              get_insert_text = "mt",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "mt",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "mt"
              },
              get_word = "mt"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1079>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40737,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1080>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1080>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1081>{
          cache = {
            entries = {
              get_completion_item = <1082>{
                command = {
                  arguments = { {
                      name = "set",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/actions/set.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1967,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "set",
                sortText = "0359"
              },
              get_filter_text = "set",
              get_insert_text = "set",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "set",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "set"
              },
              get_word = "set"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1082>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40738,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1083>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1083>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1084>{
          cache = {
            entries = {
              get_completion_item = <1085>{
                command = {
                  arguments = { {
                      name = "state",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/actions/state.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1968,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "state",
                sortText = "0360"
              },
              get_filter_text = "state",
              get_insert_text = "state",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "state",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "state"
              },
              get_word = "state"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1085>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40739,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1086>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1086>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1087>{
          cache = {
            entries = {
              get_completion_item = <1088>{
                command = {
                  arguments = { {
                      name = "utils",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/actions/utils.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1969,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "utils",
                sortText = "0361"
              },
              get_filter_text = "utils",
              get_insert_text = "utils",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "utils",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "utils"
              },
              get_word = "utils"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1088>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40740,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1089>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1089>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1090>{
          cache = {
            entries = {
              get_completion_item = <1091>{
                command = {
                  arguments = { {
                      name = "fzy",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/algos/fzy.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1970,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "fzy",
                sortText = "0362"
              },
              get_filter_text = "fzy",
              get_insert_text = "fzy",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "fzy",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "fzy"
              },
              get_word = "fzy"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1091>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40741,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1092>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1092>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1093>{
          cache = {
            entries = {
              get_completion_item = <1094>{
                command = {
                  arguments = { {
                      name = "linked_list",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/algos/linked_list.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1971,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "linked_list",
                sortText = "0363"
              },
              get_filter_text = "linked_list",
              get_insert_text = "linked_list",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "linked_list",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "linked_list"
              },
              get_word = "linked_list"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1094>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40742,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1095>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1095>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1096>{
          cache = {
            entries = {
              get_completion_item = <1097>{
                command = {
                  arguments = { {
                      name = "string_distance",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/algos/string_distance.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1972,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "string_distance",
                sortText = "0364"
              },
              get_filter_text = "string_distance",
              get_insert_text = "string_distance",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "string_distance",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "string_distance"
              },
              get_word = "string_distance"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1097>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40743,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1098>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1098>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1099>{
          cache = {
            entries = {
              get_completion_item = <1100>{
                command = {
                  arguments = { {
                      name = "command",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/command.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1973,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "command",
                sortText = "0365"
              },
              get_filter_text = "command",
              get_insert_text = "command",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "command",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "command"
              },
              get_word = "command"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1100>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40744,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1101>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1101>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1102>{
          cache = {
            entries = {
              get_completion_item = <1103>{
                command = {
                  arguments = { {
                      name = "config",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/config.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1974,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "config",
                sortText = "0366"
              },
              get_filter_text = "config",
              get_insert_text = "config",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "config",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "config"
              },
              get_word = "config"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1103>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40745,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1104>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1104>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1105>{
          cache = {
            entries = {
              get_completion_item = <1106>{
                command = {
                  arguments = { {
                      name = "resolve",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/config/resolve.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1975,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "resolve",
                sortText = "0367"
              },
              get_filter_text = "resolve",
              get_insert_text = "resolve",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "resolve",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "resolve"
              },
              get_word = "resolve"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1106>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40746,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1107>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1107>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1108>{
          cache = {
            entries = {
              get_completion_item = <1109>{
                command = {
                  arguments = { {
                      name = "debounce",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/debounce.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1976,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "debounce",
                sortText = "0368"
              },
              get_filter_text = "debounce",
              get_insert_text = "debounce",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "debounce",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "debounce"
              },
              get_word = "debounce"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1109>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40747,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1110>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1110>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1111>{
          cache = {
            entries = {
              get_completion_item = <1112>{
                command = {
                  arguments = { {
                      name = "deprecated",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/deprecated.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1977,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "deprecated",
                sortText = "0369"
              },
              get_filter_text = "deprecated",
              get_insert_text = "deprecated",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "deprecated",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "deprecated"
              },
              get_word = "deprecated"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1112>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40748,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1113>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1113>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1114>{
          cache = {
            entries = {
              get_completion_item = <1115>{
                command = {
                  arguments = { {
                      name = "entry_manager",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/entry_manager.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1978,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "entry_manager",
                sortText = "0370"
              },
              get_filter_text = "entry_manager",
              get_insert_text = "entry_manager",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "entry_manager",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "entry_manager"
              },
              get_word = "entry_manager"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1115>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40749,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1116>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1116>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1117>{
          cache = {
            entries = {
              get_completion_item = <1118>{
                command = {
                  arguments = { {
                      name = "finders",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/finders.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1979,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "finders",
                sortText = "0371"
              },
              get_filter_text = "finders",
              get_insert_text = "finders",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "finders",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "finders"
              },
              get_word = "finders"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1118>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40750,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1119>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1119>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1120>{
          cache = {
            entries = {
              get_completion_item = <1121>{
                command = {
                  arguments = { {
                      name = "async_job_finder",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/finders/async_job_finder.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1980,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "async_job_finder",
                sortText = "0372"
              },
              get_filter_text = "async_job_finder",
              get_insert_text = "async_job_finder",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "async_job_finder",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "async_job_finder"
              },
              get_word = "async_job_finder"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1121>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40751,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1122>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1122>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1123>{
          cache = {
            entries = {
              get_completion_item = <1124>{
                command = {
                  arguments = { {
                      name = "async_oneshot_finder",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/finders/async_oneshot_finder.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1981,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "async_oneshot_finder",
                sortText = "0373"
              },
              get_filter_text = "async_oneshot_finder",
              get_insert_text = "async_oneshot_finder",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "async_oneshot_finder",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "async_oneshot_finder"
              },
              get_word = "async_oneshot_finder"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1124>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40752,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1125>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1125>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1126>{
          cache = {
            entries = {
              get_completion_item = <1127>{
                command = {
                  arguments = { {
                      name = "async_static_finder",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/finders/async_static_finder.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1982,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "async_static_finder",
                sortText = "0374"
              },
              get_filter_text = "async_static_finder",
              get_insert_text = "async_static_finder",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "async_static_finder",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "async_static_finder"
              },
              get_word = "async_static_finder"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1127>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40753,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1128>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1128>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1129>{
          cache = {
            entries = {
              get_completion_item = <1130>{
                command = {
                  arguments = { {
                      name = "from_entry",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/from_entry.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1983,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "from_entry",
                sortText = "0375"
              },
              get_filter_text = "from_entry",
              get_insert_text = "from_entry",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "from_entry",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "from_entry"
              },
              get_word = "from_entry"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1130>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40754,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1131>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1131>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1132>{
          cache = {
            entries = {
              get_completion_item = <1133>{
                command = {
                  arguments = { {
                      name = "health",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/health.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1984,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "health",
                sortText = "0376"
              },
              get_filter_text = "health",
              get_insert_text = "health",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "health",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "health"
              },
              get_word = "health"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1133>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40755,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1134>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1134>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1135>{
          cache = {
            entries = {
              get_completion_item = <1136>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1985,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0377"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1136>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40756,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1137>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1137>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1138>{
          cache = {
            entries = {
              get_completion_item = <1139>{
                command = {
                  arguments = { {
                      name = "make_entry",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/make_entry.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1986,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "make_entry",
                sortText = "0378"
              },
              get_filter_text = "make_entry",
              get_insert_text = "make_entry",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "make_entry",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "make_entry"
              },
              get_word = "make_entry"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1139>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40757,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1140>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1140>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1141>{
          cache = {
            entries = {
              get_completion_item = <1142>{
                command = {
                  arguments = { {
                      name = "mappings",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/mappings.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1987,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "mappings",
                sortText = "0379"
              },
              get_filter_text = "mappings",
              get_insert_text = "mappings",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "mappings",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "mappings"
              },
              get_word = "mappings"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1142>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40758,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1143>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1143>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1144>{
          cache = {
            entries = {
              get_completion_item = <1145>{
                command = {
                  arguments = { {
                      name = "pickers",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/pickers.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1988,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "pickers",
                sortText = "0380"
              },
              get_filter_text = "pickers",
              get_insert_text = "pickers",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "pickers",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "pickers"
              },
              get_word = "pickers"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1145>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40759,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1146>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1146>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1147>{
          cache = {
            entries = {
              get_completion_item = <1148>{
                command = {
                  arguments = { {
                      name = "_test",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/pickers/_test.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1989,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "_test",
                sortText = "0381"
              },
              get_filter_text = "_test",
              get_insert_text = "_test",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "_test",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "_test"
              },
              get_word = "_test"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1148>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40760,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1149>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1149>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1150>{
          cache = {
            entries = {
              get_completion_item = <1151>{
                command = {
                  arguments = { {
                      name = "_test_helpers",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/pickers/_test_helpers.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1990,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "_test_helpers",
                sortText = "0382"
              },
              get_filter_text = "_test_helpers",
              get_insert_text = "_test_helpers",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "_test_helpers",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "_test_helpers"
              },
              get_word = "_test_helpers"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1151>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40761,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1152>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1152>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1153>{
          cache = {
            entries = {
              get_completion_item = <1154>{
                command = {
                  arguments = { {
                      name = "entry_display",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/pickers/entry_display.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1991,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "entry_display",
                sortText = "0383"
              },
              get_filter_text = "entry_display",
              get_insert_text = "entry_display",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "entry_display",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "entry_display"
              },
              get_word = "entry_display"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1154>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40762,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1155>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1155>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1156>{
          cache = {
            entries = {
              get_completion_item = <1157>{
                command = {
                  arguments = { {
                      name = "highlights",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/pickers/highlights.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1992,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "highlights",
                sortText = "0384"
              },
              get_filter_text = "highlights",
              get_insert_text = "highlights",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "highlights",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "highlights"
              },
              get_word = "highlights"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1157>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40763,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1158>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1158>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1159>{
          cache = {
            entries = {
              get_completion_item = <1160>{
                command = {
                  arguments = { {
                      name = "layout_strategies",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/pickers/layout_strategies.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1993,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "layout_strategies",
                sortText = "0385"
              },
              get_filter_text = "layout_strategies",
              get_insert_text = "layout_strategies",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "layout_strategies",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "layout_strategies"
              },
              get_word = "layout_strategies"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1160>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40764,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1161>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1161>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1162>{
          cache = {
            entries = {
              get_completion_item = <1163>{
                command = {
                  arguments = { {
                      name = "multi",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/pickers/multi.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1994,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "multi",
                sortText = "0386"
              },
              get_filter_text = "multi",
              get_insert_text = "multi",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "multi",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "multi"
              },
              get_word = "multi"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1163>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40765,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1164>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1164>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1165>{
          cache = {
            entries = {
              get_completion_item = <1166>{
                command = {
                  arguments = { {
                      name = "scroller",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/pickers/scroller.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1995,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "scroller",
                sortText = "0387"
              },
              get_filter_text = "scroller",
              get_insert_text = "scroller",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "scroller",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "scroller"
              },
              get_word = "scroller"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1166>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40766,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1167>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1167>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1168>{
          cache = {
            entries = {
              get_completion_item = <1169>{
                command = {
                  arguments = { {
                      name = "window",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/pickers/window.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1996,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "window",
                sortText = "0388"
              },
              get_filter_text = "window",
              get_insert_text = "window",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "window",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "window"
              },
              get_word = "window"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1169>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40767,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1170>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1170>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1171>{
          cache = {
            entries = {
              get_completion_item = <1172>{
                command = {
                  arguments = { {
                      name = "buffer_previewer",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/previewers/buffer_previewer.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1997,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "buffer_previewer",
                sortText = "0389"
              },
              get_filter_text = "buffer_previewer",
              get_insert_text = "buffer_previewer",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "buffer_previewer",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "buffer_previewer"
              },
              get_word = "buffer_previewer"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1172>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40768,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1173>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1173>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1174>{
          cache = {
            entries = {
              get_completion_item = <1175>{
                command = {
                  arguments = { {
                      name = "init",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/previewers/init.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1998,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "init",
                sortText = "0390"
              },
              get_filter_text = "init",
              get_insert_text = "init",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "init",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "init"
              },
              get_word = "init"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1175>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40769,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1176>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1176>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1177>{
          cache = {
            entries = {
              get_completion_item = <1178>{
                command = {
                  arguments = { {
                      name = "previewer",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/previewers/previewer.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 1999,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "previewer",
                sortText = "0391"
              },
              get_filter_text = "previewer",
              get_insert_text = "previewer",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "previewer",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "previewer"
              },
              get_word = "previewer"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1178>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40770,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1179>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1179>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1180>{
          cache = {
            entries = {
              get_completion_item = <1181>{
                command = {
                  arguments = { {
                      name = "term_previewer",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/previewers/term_previewer.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2000,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "term_previewer",
                sortText = "0392"
              },
              get_filter_text = "term_previewer",
              get_insert_text = "term_previewer",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "term_previewer",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "term_previewer"
              },
              get_word = "term_previewer"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1181>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40771,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1182>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1182>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1183>{
          cache = {
            entries = {
              get_completion_item = <1184>{
                command = {
                  arguments = { {
                      name = "utils",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/previewers/utils.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2001,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "utils",
                sortText = "0393"
              },
              get_filter_text = "utils",
              get_insert_text = "utils",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "utils",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "utils"
              },
              get_word = "utils"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1184>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40772,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1185>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1185>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1186>{
          cache = {
            entries = {
              get_completion_item = <1187>{
                command = {
                  arguments = { {
                      name = "sorters",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/sorters.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2002,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "sorters",
                sortText = "0394"
              },
              get_filter_text = "sorters",
              get_insert_text = "sorters",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "sorters",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "sorters"
              },
              get_word = "sorters"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1187>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40773,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1188>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1188>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1189>{
          cache = {
            entries = {
              get_completion_item = <1190>{
                command = {
                  arguments = { {
                      name = "state",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/state.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2003,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "state",
                sortText = "0395"
              },
              get_filter_text = "state",
              get_insert_text = "state",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "state",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "state"
              },
              get_word = "state"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1190>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40774,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1191>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1191>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1192>{
          cache = {
            entries = {
              get_completion_item = <1193>{
                command = {
                  arguments = { {
                      name = "themes",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/themes.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2004,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "themes",
                sortText = "0396"
              },
              get_filter_text = "themes",
              get_insert_text = "themes",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "themes",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "themes"
              },
              get_word = "themes"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1193>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40775,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1194>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1194>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1195>{
          cache = {
            entries = {
              get_completion_item = <1196>{
                command = {
                  arguments = { {
                      name = "utils",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/utils.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2005,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "utils",
                sortText = "0397"
              },
              get_filter_text = "utils",
              get_insert_text = "utils",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "utils",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "utils"
              },
              get_word = "utils"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1196>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40776,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1197>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1197>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1198>{
          cache = {
            entries = {
              get_completion_item = <1199>{
                command = {
                  arguments = { {
                      name = "helpers",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/tests/helpers.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2006,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "helpers",
                sortText = "0398"
              },
              get_filter_text = "helpers",
              get_insert_text = "helpers",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "helpers",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "helpers"
              },
              get_word = "helpers"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1199>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40777,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1200>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1200>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1201>{
          cache = {
            entries = {
              get_completion_item = <1202>{
                command = {
                  arguments = { {
                      name = "gendocs",
                      target = "file:///home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim/scripts/gendocs.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2007,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "gendocs",
                sortText = "0399"
              },
              get_filter_text = "gendocs",
              get_insert_text = "gendocs",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "gendocs",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "gendocs"
              },
              get_word = "gendocs"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1202>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40778,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1203>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1203>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1204>{
          cache = {
            entries = {
              get_completion_item = <1205>{
                command = {
                  arguments = { {
                      name = "man",
                      target = "file:///usr/share/nvim/runtime/lua/man.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2008,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "man",
                sortText = "0400"
              },
              get_filter_text = "man",
              get_insert_text = "man",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "man",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "man"
              },
              get_word = "man"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1205>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40779,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1206>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1206>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1207>{
          cache = {
            entries = {
              get_completion_item = <1208>{
                command = {
                  arguments = { {
                      name = "F",
                      target = "file:///usr/share/nvim/runtime/lua/vim/F.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2009,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "F",
                sortText = "0401"
              },
              get_filter_text = "F",
              get_insert_text = "F",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "F",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "F"
              },
              get_word = "F"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1208>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40780,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1209>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1209>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1210>{
          cache = {
            entries = {
              get_completion_item = <1211>{
                command = {
                  arguments = { {
                      name = "_editor",
                      target = "file:///usr/share/nvim/runtime/lua/vim/_editor.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2010,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "_editor",
                sortText = "0402"
              },
              get_filter_text = "_editor",
              get_insert_text = "_editor",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "_editor",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "_editor"
              },
              get_word = "_editor"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1211>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40781,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1212>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1212>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1213>{
          cache = {
            entries = {
              get_completion_item = <1214>{
                command = {
                  arguments = { {
                      name = "diagnostic",
                      target = "file:///usr/share/nvim/runtime/lua/vim/diagnostic.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2011,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "diagnostic",
                sortText = "0403"
              },
              get_filter_text = "diagnostic",
              get_insert_text = "diagnostic",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "diagnostic",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "diagnostic"
              },
              get_word = "diagnostic"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1214>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40782,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1215>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1215>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1216>{
          cache = {
            entries = {
              get_completion_item = <1217>{
                command = {
                  arguments = { {
                      name = "filetype",
                      target = "file:///usr/share/nvim/runtime/lua/vim/filetype.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2012,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "filetype",
                sortText = "0404"
              },
              get_filter_text = "filetype",
              get_insert_text = "filetype",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "filetype",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "filetype"
              },
              get_word = "filetype"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1217>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40783,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1218>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1218>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1219>{
          cache = {
            entries = {
              get_completion_item = <1220>{
                command = {
                  arguments = { {
                      name = "detect",
                      target = "file:///usr/share/nvim/runtime/lua/vim/filetype/detect.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2013,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "detect",
                sortText = "0405"
              },
              get_filter_text = "detect",
              get_insert_text = "detect",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "detect",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "detect"
              },
              get_word = "detect"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1220>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40784,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1221>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1221>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1222>{
          cache = {
            entries = {
              get_completion_item = <1223>{
                command = {
                  arguments = { {
                      name = "fs",
                      target = "file:///usr/share/nvim/runtime/lua/vim/fs.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2014,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "fs",
                sortText = "0406"
              },
              get_filter_text = "fs",
              get_insert_text = "fs",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "fs",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "fs"
              },
              get_word = "fs"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1223>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40785,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1224>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1224>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1225>{
          cache = {
            entries = {
              get_completion_item = <1226>{
                command = {
                  arguments = { {
                      name = "health",
                      target = "file:///usr/share/nvim/runtime/lua/vim/health.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2015,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "health",
                sortText = "0407"
              },
              get_filter_text = "health",
              get_insert_text = "health",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "health",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "health"
              },
              get_word = "health"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1226>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40786,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1227>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1227>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1228>{
          cache = {
            entries = {
              get_completion_item = <1229>{
                command = {
                  arguments = { {
                      name = "highlight",
                      target = "file:///usr/share/nvim/runtime/lua/vim/highlight.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2016,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "highlight",
                sortText = "0408"
              },
              get_filter_text = "highlight",
              get_insert_text = "highlight",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "highlight",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "highlight"
              },
              get_word = "highlight"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1229>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40787,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1230>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1230>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1231>{
          cache = {
            entries = {
              get_completion_item = <1232>{
                command = {
                  arguments = { {
                      name = "inspect",
                      target = "file:///usr/share/nvim/runtime/lua/vim/inspect.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2017,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "inspect",
                sortText = "0409"
              },
              get_filter_text = "inspect",
              get_insert_text = "inspect",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "inspect",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "inspect"
              },
              get_word = "inspect"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1232>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40788,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1233>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1233>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1234>{
          cache = {
            entries = {
              get_completion_item = <1235>{
                command = {
                  arguments = { {
                      name = "keymap",
                      target = "file:///usr/share/nvim/runtime/lua/vim/keymap.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2018,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "keymap",
                sortText = "0410"
              },
              get_filter_text = "keymap",
              get_insert_text = "keymap",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "keymap",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "keymap"
              },
              get_word = "keymap"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1235>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40789,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1236>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1236>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1237>{
          cache = {
            entries = {
              get_completion_item = <1238>{
                command = {
                  arguments = { {
                      name = "lsp",
                      target = "file:///usr/share/nvim/runtime/lua/vim/lsp.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2019,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "lsp",
                sortText = "0411"
              },
              get_filter_text = "lsp",
              get_insert_text = "lsp",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "lsp",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "lsp"
              },
              get_word = "lsp"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1238>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40790,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1239>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1239>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1240>{
          cache = {
            entries = {
              get_completion_item = <1241>{
                command = {
                  arguments = { {
                      name = "_snippet",
                      target = "file:///usr/share/nvim/runtime/lua/vim/lsp/_snippet.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2020,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "_snippet",
                sortText = "0412"
              },
              get_filter_text = "_snippet",
              get_insert_text = "_snippet",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "_snippet",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "_snippet"
              },
              get_word = "_snippet"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1241>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40791,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1242>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1242>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1243>{
          cache = {
            entries = {
              get_completion_item = <1244>{
                command = {
                  arguments = { {
                      name = "buf",
                      target = "file:///usr/share/nvim/runtime/lua/vim/lsp/buf.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2021,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "buf",
                sortText = "0413"
              },
              get_filter_text = "buf",
              get_insert_text = "buf",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "buf",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "buf"
              },
              get_word = "buf"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1244>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40792,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1245>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1245>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1246>{
          cache = {
            entries = {
              get_completion_item = <1247>{
                command = {
                  arguments = { {
                      name = "codelens",
                      target = "file:///usr/share/nvim/runtime/lua/vim/lsp/codelens.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2022,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "codelens",
                sortText = "0414"
              },
              get_filter_text = "codelens",
              get_insert_text = "codelens",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "codelens",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "codelens"
              },
              get_word = "codelens"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1247>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40793,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1248>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1248>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1249>{
          cache = {
            entries = {
              get_completion_item = <1250>{
                command = {
                  arguments = { {
                      name = "diagnostic",
                      target = "file:///usr/share/nvim/runtime/lua/vim/lsp/diagnostic.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2023,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "diagnostic",
                sortText = "0415"
              },
              get_filter_text = "diagnostic",
              get_insert_text = "diagnostic",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "diagnostic",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "diagnostic"
              },
              get_word = "diagnostic"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1250>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40794,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1251>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1251>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1252>{
          cache = {
            entries = {
              get_completion_item = <1253>{
                command = {
                  arguments = { {
                      name = "handlers",
                      target = "file:///usr/share/nvim/runtime/lua/vim/lsp/handlers.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2024,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "handlers",
                sortText = "0416"
              },
              get_filter_text = "handlers",
              get_insert_text = "handlers",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "handlers",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "handlers"
              },
              get_word = "handlers"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1253>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40795,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1254>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1254>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1255>{
          cache = {
            entries = {
              get_completion_item = <1256>{
                command = {
                  arguments = { {
                      name = "health",
                      target = "file:///usr/share/nvim/runtime/lua/vim/lsp/health.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2025,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "health",
                sortText = "0417"
              },
              get_filter_text = "health",
              get_insert_text = "health",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "health",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "health"
              },
              get_word = "health"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1256>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40796,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1257>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1257>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1258>{
          cache = {
            entries = {
              get_completion_item = <1259>{
                command = {
                  arguments = { {
                      name = "log",
                      target = "file:///usr/share/nvim/runtime/lua/vim/lsp/log.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2026,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "log",
                sortText = "0418"
              },
              get_filter_text = "log",
              get_insert_text = "log",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "log",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "log"
              },
              get_word = "log"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1259>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40797,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1260>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1260>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1261>{
          cache = {
            entries = {
              get_completion_item = <1262>{
                command = {
                  arguments = { {
                      name = "protocol",
                      target = "file:///usr/share/nvim/runtime/lua/vim/lsp/protocol.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2027,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "protocol",
                sortText = "0419"
              },
              get_filter_text = "protocol",
              get_insert_text = "protocol",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "protocol",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "protocol"
              },
              get_word = "protocol"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1262>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40798,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1263>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1263>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1264>{
          cache = {
            entries = {
              get_completion_item = <1265>{
                command = {
                  arguments = { {
                      name = "rpc",
                      target = "file:///usr/share/nvim/runtime/lua/vim/lsp/rpc.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2028,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "rpc",
                sortText = "0420"
              },
              get_filter_text = "rpc",
              get_insert_text = "rpc",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "rpc",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "rpc"
              },
              get_word = "rpc"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1265>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40799,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1266>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1266>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1267>{
          cache = {
            entries = {
              get_completion_item = <1268>{
                command = {
                  arguments = { {
                      name = "sync",
                      target = "file:///usr/share/nvim/runtime/lua/vim/lsp/sync.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2029,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "sync",
                sortText = "0421"
              },
              get_filter_text = "sync",
              get_insert_text = "sync",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "sync",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "sync"
              },
              get_word = "sync"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1268>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40800,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1269>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1269>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1270>{
          cache = {
            entries = {
              get_completion_item = <1271>{
                command = {
                  arguments = { {
                      name = "tagfunc",
                      target = "file:///usr/share/nvim/runtime/lua/vim/lsp/tagfunc.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2030,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "tagfunc",
                sortText = "0422"
              },
              get_filter_text = "tagfunc",
              get_insert_text = "tagfunc",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "tagfunc",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "tagfunc"
              },
              get_word = "tagfunc"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1271>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40801,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1272>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1272>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1273>{
          cache = {
            entries = {
              get_completion_item = <1274>{
                command = {
                  arguments = { {
                      name = "util",
                      target = "file:///usr/share/nvim/runtime/lua/vim/lsp/util.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2031,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "util",
                sortText = "0423"
              },
              get_filter_text = "util",
              get_insert_text = "util",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "util",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "util"
              },
              get_word = "util"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1274>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40802,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1275>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1275>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1276>{
          cache = {
            entries = {
              get_completion_item = <1277>{
                command = {
                  arguments = { {
                      name = "shared",
                      target = "file:///usr/share/nvim/runtime/lua/vim/shared.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2032,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "shared",
                sortText = "0424"
              },
              get_filter_text = "shared",
              get_insert_text = "shared",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "shared",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "shared"
              },
              get_word = "shared"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1277>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40803,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1278>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1278>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1279>{
          cache = {
            entries = {
              get_completion_item = <1280>{
                command = {
                  arguments = { {
                      name = "treesitter",
                      target = "file:///usr/share/nvim/runtime/lua/vim/treesitter.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2033,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "treesitter",
                sortText = "0425"
              },
              get_filter_text = "treesitter",
              get_insert_text = "treesitter",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "treesitter",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "treesitter"
              },
              get_word = "treesitter"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1280>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40804,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1281>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1281>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1282>{
          cache = {
            entries = {
              get_completion_item = <1283>{
                command = {
                  arguments = { {
                      name = "health",
                      target = "file:///usr/share/nvim/runtime/lua/vim/treesitter/health.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2034,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "health",
                sortText = "0426"
              },
              get_filter_text = "health",
              get_insert_text = "health",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "health",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "health"
              },
              get_word = "health"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1283>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40805,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1284>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1284>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1285>{
          cache = {
            entries = {
              get_completion_item = <1286>{
                command = {
                  arguments = { {
                      name = "highlighter",
                      target = "file:///usr/share/nvim/runtime/lua/vim/treesitter/highlighter.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2035,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "highlighter",
                sortText = "0427"
              },
              get_filter_text = "highlighter",
              get_insert_text = "highlighter",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "highlighter",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "highlighter"
              },
              get_word = "highlighter"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1286>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40806,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1287>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1287>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1288>{
          cache = {
            entries = {
              get_completion_item = <1289>{
                command = {
                  arguments = { {
                      name = "language",
                      target = "file:///usr/share/nvim/runtime/lua/vim/treesitter/language.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2036,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "language",
                sortText = "0428"
              },
              get_filter_text = "language",
              get_insert_text = "language",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "language",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "language"
              },
              get_word = "language"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1289>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40807,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1290>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1290>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1291>{
          cache = {
            entries = {
              get_completion_item = <1292>{
                command = {
                  arguments = { {
                      name = "languagetree",
                      target = "file:///usr/share/nvim/runtime/lua/vim/treesitter/languagetree.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2037,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "languagetree",
                sortText = "0429"
              },
              get_filter_text = "languagetree",
              get_insert_text = "languagetree",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "languagetree",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "languagetree"
              },
              get_word = "languagetree"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1292>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40808,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1293>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1293>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1294>{
          cache = {
            entries = {
              get_completion_item = <1295>{
                command = {
                  arguments = { {
                      name = "query",
                      target = "file:///usr/share/nvim/runtime/lua/vim/treesitter/query.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2038,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "query",
                sortText = "0430"
              },
              get_filter_text = "query",
              get_insert_text = "query",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "query",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "query"
              },
              get_word = "query"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1295>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40809,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1296>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1296>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1297>{
          cache = {
            entries = {
              get_completion_item = <1298>{
                command = {
                  arguments = { {
                      name = "ui",
                      target = "file:///usr/share/nvim/runtime/lua/vim/ui.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2039,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "ui",
                sortText = "0431"
              },
              get_filter_text = "ui",
              get_insert_text = "ui",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "ui",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "ui"
              },
              get_word = "ui"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1298>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40810,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1299>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1299>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        }, <1300>{
          cache = {
            entries = {
              get_completion_item = <1301>{
                command = {
                  arguments = { {
                      name = "uri",
                      target = "file:///usr/share/nvim/runtime/lua/vim/uri.lua",
                      uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                    } },
                  command = "lua.autoRequire",
                  title = "autoRequire"
                },
                commitCharacters = { "." },
                data = {
                  id = 2040,
                  uri = "file:///home/huy/.dotfiles/vim/.config/nvim/lua/neovide.lua"
                },
                insertTextFormat = 2,
                kind = 6,
                label = "uri",
                sortText = "0432"
              },
              get_filter_text = "uri",
              get_insert_text = "uri",
              get_offset = 1,
              ["get_vim_item:1"] = {
                abbr = "uri",
                dup = 1,
                empty = 1,
                equal = 1,
                kind = "",
                menu = "[LSP]",
                word = "uri"
              },
              get_word = "uri"
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          completion_item = <table 1301>,
          confirmed = false,
          context = <table 7>,
          exact = false,
          id = 40811,
          match_cache = {
            entries = {
              [":0:0:0:0"] = {
                matches = <1302>{},
                score = 14
              }
            },
            <metatable> = {
              __index = <table 6>
            }
          },
          matches = <table 1302>,
          resolved_callbacks = {},
          resolving = false,
          score = 14,
          source = <table 1>,
          source_insert_range = <table 2>,
          source_offset = 1,
          source_replace_range = <table 3>,
          <metatable> = {
            __index = <table 9>
          }
        } }
    },
    <metatable> = {
      __index = <table 6>
    }
  },
  complete_dedup = <function 33>,
  completion_context = {
    triggerKind = 1
  },
  context = <table 7>,
  entries = { <table 4>, <table 10>, <table 13>, <table 16>, <table 19>, <table 22>, <table 25>, <table 28>, <table 31>, <table 34>, <table 37>, <table 40>, <table 43>, <... <table 1267>, <table 1270>, <table 1273>, <table 1276>, <table 1279>, <table 1282>, <table 1285>, <table 1288>, <table 1291>, <table 1294>, <table 1297>, <table 1300> },
  id = 11,
  incomplete = false,
  is_triggered_by_symbol = false,
  name = "nvim_lsp",
  offset = 1,
  request_offset = 1,
  revision = 28,
  source = {
    client = {
      _on_attach = <function 34>,
      attached_buffers = {
        [2] = true,
        [3] = true,
        [32] = true
      },
      cancel_request = <function 35>,
      commands = {},
      config = {
        _on_attach = <function 36>,
        autostart = true,
        capabilities = {
          callHierarchy = {
            dynamicRegistration = false
          },
          textDocument = {
            codeAction = {
              codeActionLiteralSupport = {
                codeActionKind = {
                  valueSet = { "", "Empty", "QuickFix", "Refactor", "RefactorExtract", "RefactorInline", "RefactorRewrite", "Source", "SourceOrganizeImports", "quickfix", "refactor", "refactor.extract", "refactor.inline", "refactor.rewrite", "source", "source.organizeImports" }
                }
              },
              dataSupport = true,
              dynamicRegistration = false,
              isPreferredSupport = true,
              resolveSupport = {
                properties = { "edit" }
              }
            },
            completion = {
              completionItem = {
                commitCharactersSupport = true,
                deprecatedSupport = true,
                documentationFormat = { "markdown", "plaintext" },
                insertReplaceSupport = true,
                insertTextModeSupport = {
                  valueSet = { 1, 2 }
                },
                labelDetailsSupport = true,
                preselectSupport = true,
                resolveSupport = {
                  properties = { "documentation", "detail", "additionalTextEdits" }
                },
                snippetSupport = true,
                tagSupport = {
                  valueSet = { 1 }
                }
              },
              completionItemKind = {
                valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25 }
              },
              completionList = {
                itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
              },
              contextSupport = true,
              dynamicRegistration = false,
              insertTextMode = 1
            },
            declaration = {
              linkSupport = true
            },
            definition = {
              linkSupport = true
            },
            documentHighlight = {
              dynamicRegistration = false
            },
            documentSymbol = {
              dynamicRegistration = false,
              hierarchicalDocumentSymbolSupport = true,
              symbolKind = {
                valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26 }
              }
            },
            hover = {
              contentFormat = { "markdown", "plaintext" },
              dynamicRegistration = false
            },
            implementation = {
              linkSupport = true
            },
            publishDiagnostics = {
              relatedInformation = true,
              tagSupport = {
                valueSet = { 1, 2 }
              }
            },
            references = {
              dynamicRegistration = false
            },
            rename = {
              dynamicRegistration = false,
              prepareSupport = true
            },
            signatureHelp = {
              dynamicRegistration = false,
              signatureInformation = {
                activeParameterSupport = true,
                documentationFormat = { "markdown", "plaintext" },
                parameterInformation = {
                  labelOffsetSupport = true
                }
              }
            },
            synchronization = {
              didSave = true,
              dynamicRegistration = false,
              willSave = false,
              willSaveWaitUntil = false
            },
            typeDefinition = {
              linkSupport = true
            }
          },
          window = {
            showDocument = {
              support = false
            },
            showMessage = {
              messageActionItem = {
                additionalPropertiesSupport = false
              }
            },
            workDoneProgress = true
          },
          workspace = {
            applyEdit = true,
            configuration = true,
            symbol = {
              dynamicRegistration = false,
              hierarchicalWorkspaceSymbolSupport = true,
              symbolKind = {
                valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26 }
              }
            },
            workspaceEdit = {
              resourceOperations = { "rename", "create", "delete" }
            },
            workspaceFolders = true
          }
        },
        cmd = { "lua-language-server" },
        cmd_cwd = "/home/huy/.dotfiles/vim/.config/nvim",
        filetypes = { "lua" },
        flags = {
          debounce_text_changes = 150
        },
        get_language_id = <function 37>,
        handlers = <1303>{},
        init_options = vim.empty_dict(),
        log_level = 2,
        message_level = 2,
        name = "sumneko_lua",
        on_attach = <function 38>,
        on_exit = <function 39>,
        on_init = <function 40>,
        on_new_config = <function 41>,
        root_dir = "/home/huy/.dotfiles/vim/.config/nvim",
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            },
            runtime = {
              path = { "meta/LuaJIT en-us utf8/?.lua", "meta/LuaJIT en-us utf8/?/init.lua", "library/?.lua", "library/?/init.lua", "lua/?.lua", "lua/?/init.lua" },
              pathStrict = false,
              version = "LuaJIT"
            },
            telemetry = {
              enable = false
            },
            workspace = {
              ignoreDir = { "types/nightly", "types/nightly" },
              library = { "/home/huy/.local/share/nvim/site/pack/packer/start/neodev.nvim/types/stable", "/usr/share/nvim/runtime", "/home/huy/.local/share/nvim/site/pack/packer/start/neotest", "/home/huy/.local/share/nvim/site/pack/packer/start/nvim-treesitter", "/home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim", "/home/huy/...e/pack/packer/start/neodev.nvim/types/stable", "/usr/share/nvim/runtime", "/home/huy/.local/share/nvim/site/pack/packer/start/neotest", "/home/huy/.local/share/nvim/site/pack/packer/start/nvim-treesitter", "/home/huy/.local/share/nvim/site/pack/packer/start/plenary.nvim", "/home/huy/.local/share/nvim/site/pack/packer/start/telescope.nvim" }
            }
          }
        },
        single_file_support = true,
        workspace_folders = <1304>{ {
            name = "/home/huy/.dotfiles/vim/.config/nvim",
            uri = "file:///home/huy/.dotfiles/vim/.config/nvim"
          } },
        <metatable> = <1305>{
          __tostring = <function 42>
        }
      },
      handlers = <table 1303>,
      id = 2,
      initialized = true,
      is_stopped = <function 43>,
      messages = {
        messages = {},
        name = "sumneko_lua",
        progress = {
          [2] = {
            done = true,
            percentage = 100,
            title = "Loading workspace"
          },
          [3] = {
            done = true,
            percentage = 98,
            title = "Loading workspace"
          },
          [504] = {
            cancellable = false,
            done = true,
            percentage = 0,
            title = "Processing file symbols..."
          },
          [505] = {
            done = true,
            percentage = 22,
            title = "Diagnosing workspace"
          },
          [506] = {
            cancellable = false,
            done = true,
            percentage = 0,
            title = "Diagnosing"
          },
          [1200] = {
            done = true,
            percentage = 15,
            title = "Diagnosing workspace"
          }
        },
        status = {}
      },
      name = "sumneko_lua",
      notify = <function 44>,
      offset_encoding = "utf-16",
      request = <function 45>,
      request_sync = <function 46>,
      requests = {},
      rpc = {
        is_closing = <function 47>,
        notify = <function 48>,
        request = <function 49>,
        terminate = <function 50>
      },
      server_capabilities = {
        codeActionProvider = {
          codeActionKinds = { "", "quickfix", "refactor.rewrite", "refactor.extract" },
          resolveProvider = false
        },
        colorProvider = true,
        completionProvider = {
          resolveProvider = true,
          triggerCharacters = { "\t", "\n", ".", ":", "(", "'", '"', "[", ",", "#", "*", "@", "|", "=", "-", "{", " ", "+", "?" }
        },
        definitionProvider = true,
        documentFormattingProvider = true,
        documentHighlightProvider = true,
        documentOnTypeFormattingProvider = {
          firstTriggerCharacter = "\n"
        },
        documentRangeFormattingProvider = true,
        documentSymbolProvider = true,
        executeCommandProvider = {
          commands = { "lua.removeSpace", "lua.solve", "lua.jsonToLua", "lua.setConfig", "lua.autoRequire" }
        },
        foldingRangeProvider = true,
        hoverProvider = true,
        inlayHintProvider = {
          resolveProvider = true
        },
        offsetEncoding = "utf-16",
        referencesProvider = true,
        renameProvider = {
          prepareProvider = true
        },
        semanticTokensProvider = {
          full = true,
          legend = {
            tokenModifiers = { "declaration", "definition", "readonly", "static", "deprecated", "abstract", "async", "modification", "documentation", "defaultLibrary", "global" },
            tokenTypes = { "namespace", "type", "class", "enum", "interface", "struct", "typeParameter", "parameter", "variable", "property", "enumMember", "event", "function", "method", "macro", "keyword", "modifier", "comment", "string", "number", "regexp", "operator", "decorator" }
          },
          range = true
        },
        signatureHelpProvider = {
          triggerCharacters = { "(", "," }
        },
        textDocumentSync = {
          change = 2,
          openClose = true,
          save = {
            includeText = false
          }
        },
        typeDefinitionProvider = true,
        workspace = {
          workspaceFolders = {
            changeNotifications = true,
            supported = true
          }
        },
        workspaceSymbolProvider = true
      },
      stop = <function 51>,
      supports_method = <function 52>,
      workspaceFolders = <table 1304>,
      workspace_did_change_configuration = <function 53>,
      workspace_folders = <table 1304>,
      <metatable> = {
        __index = <function 54>
      }
    },
    request_ids = {},
    <metatable> = {
      __index = {
        _get = <function 55>,
        _request = <function 56>,
        complete = <function 57>,
        execute = <function 58>,
        get_debug_name = <function 59>,
        get_keyword_pattern = <function 60>,
        get_position_encoding_kind = <function 61>,
        get_trigger_characters = <function 62>,
        is_available = <function 63>,
        new = <function 64>,
        resolve = <function 65>
      }
    }
  },
  status = 3,
  <metatable> = {
    __index = {
      SourceStatus = {
        COMPLETED = 3,
        FETCHING = 2,
        WAITING = 1
      },
      complete = <function 66>,
      execute = <function 67>,
      get_debug_name = <function 68>,
      get_default_insert_range = <function 69>,
      get_default_replace_range = <function 70>,
      get_entries = <function 71>,
      get_entry_filter = <function 72>,
      get_fetching_time = <function 73>,
      get_keyword_length = <function 74>,
      get_keyword_pattern = <function 75>,
      get_matching_config = <function 76>,
      get_position_encoding_kind = <function 77>,
      get_source_config = <function 78>,
      get_trigger_characters = <function 79>,
      is_available = <function 80>,
      new = <function 81>,
      reset = <function 82>,
      resolve = <function 83>
    }
  }
}

{
  cache = {
    entries = {
      ["get_default_insert_range:4"] = {
        ["end"] = {
          character = 4,
          line = 52
        },
        start = {
          character = 0,
          line = 52
        }
      },
      ["get_default_replace_range:4"] = {
        ["end"] = {
          character = 31,
          line = 52
        },
        start = {
          character = 1,
          line = 52
        }
      },
      ["get_entries:5:\t\t\t-"] = {}
    },
    <metatable> = {
      __index = <1>{
        clear = <function 1>,
        ensure = <function 2>,
        get = <function 3>,
        key = <function 4>,
        new = <function 5>,
        set = <function 6>
      }
    }
  },
  complete_dedup = <function 7>,
  completion_context = {
    triggerKind = 1
  },
  context = {
    bufnr = 3,
    cache = {
      entries = {
        ["get_offset:.*:\t\t\t-"] = 1,
        ["get_offset:\\%(-\\?\\d\\+\\%(\\.\\d\\+\\)\\?\\|\\h\\%(\\w\\|á\\|Á\\|é\\|É\\|í\\|Í\\|ó\\|Ó\\|ú\\|Ú\\)*\\%(-\\%(\\w\\|á\\|Á\\|é\\|É\\|í\\|Í\\|ó\\|Ó\\|ú\\|Ú\\)*\\)*\\):\t\t\t-"] = 5,
        ["get_offset:\\%(-\\?\\d\\+\\%(\\.\\d\\+\\)\\?\\|\\h\\w*\\%(-\\w*\\)*\\):\t\t\t-"] = 5,
        ["get_offset:\\%([^/\\\\:\\*?<>'\"`\\|]\\)*:\t\t\t-"] = 1,
        ["get_offset:\\%([^[:alnum:][:blank:]]\\|\\w\\+\\):\t\t\t-"] = 4,
        ["get_offset:\\w\\+:\t\t\t-"] = 5
      },
      <metatable> = {
        __index = <table 1>
      }
    },
    cursor = {
      character = 4,
      col = 5,
      line = 52,
      row = 53
    },
    cursor_after_line = "if Counter % 1000 == 0 then",
    cursor_before_line = "\t\t\t-",
    cursor_line = "\t\t\t-if Counter % 1000 == 0 then",
    filetype = "lua",
    id = 49,
    option = {
      reason = "auto"
    },
    prev_context = {
      bufnr = 3,
      cursor = {
        character = 3,
        col = 4,
        line = 52,
        row = 53
      },
      cursor_after_line = "if Counter % 1000 == 0 then",
      cursor_before_line = "\t\t\t",
      cursor_line = "\t\t\tif Counter % 1000 == 0 then",
      filetype = "lua",
      id = 48,
      option = {},
      time = 3269642
    },
    time = 3269858,
    <metatable> = {
      __index = {
        changed = <function 8>,
        clone = <function 9>,
        empty = <function 10>,
        get_offset = <function 11>,
        get_reason = <function 12>,
        new = <function 13>
      }
    }
  },
  entries = {},
  id = 4,
  incomplete = false,
  is_triggered_by_symbol = false,
  name = "cmdline_history",
  offset = 1,
  request_offset = 1,
  revision = 6,
  source = {
    <metatable> = {
      __index = {
        complete = <function 14>,
        get_keyword_pattern = <function 15>,
        new = <function 16>
      }
    }
  },
  status = 3,
  <metatable> = {
    __index = {
      SourceStatus = {
        COMPLETED = 3,
        FETCHING = 2,
        WAITING = 1
      },
      complete = <function 17>,
      execute = <function 18>,
      get_debug_name = <function 19>,
      get_default_insert_range = <function 20>,
      get_default_replace_range = <function 21>,
      get_entries = <function 22>,
      get_entry_filter = <function 23>,
      get_fetching_time = <function 24>,
      get_keyword_length = <function 25>,
      get_keyword_pattern = <function 26>,
      get_matching_config = <function 27>,
      get_position_encoding_kind = <function 28>,
      get_source_config = <function 29>,
      get_trigger_characters = <function 30>,
      is_available = <function 31>,
      new = <function 32>,
      reset = <function 33>,
      resolve = <function 34>
    }
  }
}
