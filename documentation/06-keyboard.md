# Keyboard

Determining if a key was down:

```
if args.inputs.keyboard.key_down.a
  puts 'The key was in the down state'
end
```

Determining if a key is being held:

```
if args.inputs.keyboard.key_held.a
  puts 'The key is being held'
end
```

Determining if a key is in the down state or is being held:

```
if args.inputs.keyboard.a
  puts 'The key is being held'
end
```

Determining if a key is released:

```
if args.inputs.keyboard.key_up.a
  puts 'The key is being held'
end
```

# List of keys:

These are the character and associated properities that will
be set to true.

For example `A => :a, :shift` means that `args.inputs.keyboard.a`
would be true and so would `args.inputs.keyboard.shift`
(if both keys were being held or in the down state).

```
A  => :a, :shift
B  => :b, :shift
C  => :c, :shift
D  => :d, :shift
E  => :e, :shift
F  => :f, :shift
G  => :g, :shift
H  => :h, :shift
I  => :i, :shift
J  => :j, :shift
K  => :k, :shift
L  => :l, :shift
M  => :m, :shift
N  => :n, :shift
O  => :o, :shift
P  => :p, :shift
Q  => :q, :shift
R  => :r, :shift
S  => :s, :shift
T  => :t, :shift
U  => :u, :shift
V  => :v, :shift
W  => :w, :shift
X  => :x, :shift
Y  => :y, :shift
Z  => :z, :shift
!  => :exclamation_point
0  => :zero
1  => :one
2  => :two
3  => :three
4  => :four
5  => :five
6  => :six
7  => :seven
8  => :eight
9  => :nine
\b => :backspace
\e => :escape
\r => :enter
\t => :tab
(  => :open_round_brace
)  => :close_round_brace
{  => :open_curly_brace
}  => :close_curly_brace
[  => :open_square_brace
]  => :close_square_brace
:  => :colon
;  => :semicolon
=  => :equal_sign
-  => :hyphen
   => :space
$  => :dollar_sign
"  => :double_quotation_mark
'  => :single_quotation_mark
`  => :backtick
~  => :tilde
.  => :period
,  => :comma
|  => :pipe
_  => :underscore
#  => :hash
+  => :plus
@  => :at
/  => :forward_slash
\  => :back_slash
*  => :asterisk
<  => :less_than
>  => :greater_than
^  => :greater_than
&  => :ampersand
²  => :superscript_two
§  => :section_sign
?  => :question_mark
%  => :percent_sign
º  => :ordinal_indicator
right arrow => :right
left arrow  => :left
down arrow  => :down
up arrow    => :up
delete key  => :delete
control key => :control
windows key/command key => :meta
alt key => :alt
```
