require 'helper'

scope do
  def foo
    'foo'
  end

  test 'responds to foo' do
    assert respond_to? :foo
    assert foo == 'foo'
  end

  test 'does not respond to bar' do
    assert !respond_to?(:bar)
  end

  scope do
    def bar
      'bar'
    end

    test 'responds to foo' do
      assert respond_to? :foo
      assert foo == 'foo'
    end

    test 'responds to bar' do
      assert respond_to? :bar
      assert bar == 'bar'
    end
  end
end

scope do
  test 'does not respond to foo' do
    assert !respond_to?(:foo)
  end

  def foo
    'foo'
  end

  test 'responds to foo' do
    assert respond_to? :foo
  end
end

scope do
  setup do
    @foo = 'foo'
  end

  scope do
    setup do
      @bar = 'bar'
    end

    test 'foo and bar are defined' do
      assert @foo == 'foo'
      assert @bar == 'bar'
    end
  end

  test 'foo is defined and bar is not' do
    assert @foo == 'foo'
    assert @bar.nil?
  end
end

scope do
  def foo
    'foo'
  end

  setup do
    @foo = foo
  end

  test 'foo is defined' do
    assert @foo == 'foo'
  end
end
