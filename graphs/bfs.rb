def bfs(nodes, target = nil, &prc)
  raise 'Need a proc or target!' if [target, prc].none?
  prc ||= Proc.new { |node| node.value == target }

  until nodes.empty?
    node = nodes.shift

    return node if prc.call(node)
    nodes.concat(node.children)
  end

  nil
end
