def test_cannon_creation args, assert
  cannon = Cannon.new 16
  assert.true! cannon.x == 16, "error: cannon x position incorrect"
  assert.true! cannon.y == 16, "error: cannon y position incorrect"
end

$gtk.tests.start
