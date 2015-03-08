def dfs(node, target = nil, &prc)
  raise 'Need a proc or target!' if [target, prc].none?
  prc ||= Proc.new { |node| node.value == target }

  return node if prc.call(node)

  node.children.each do |child|
    result = dfs(child, target, &prc)
    return result unless result.nil?
  end

  nil
end
