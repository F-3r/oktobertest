scope 'run this' do
  test 'run this' do
    assert true
  end

  test 'and this' do
    assert true
  end
end

scope 'and not this' do
  test 'run this' do
    assert false
  end

  test 'and this' do
    assert false
  end
end