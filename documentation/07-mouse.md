# Mouse

Determining current position of mouse:

```
args.inputs.mouse.x
args.inputs.mouse.y
```

Determining if the mouse has been clicked, and it's position. Note:
`click` and `down` are aliases for each other.

```
if args.inputs.mouse.click
  puts args.inputs.mouse.click
  puts args.inputs.mouse.click.position.x
  puts args.inputs.mouse.click.position.y
end
```

Determining if the mouse button has been released:

```
if args.inputs.mouse.up
  puts args.inputs.mouse.up
  puts args.inputs.mouse.up.position.x
  puts args.inputs.mouse.up.position.y
end
```
