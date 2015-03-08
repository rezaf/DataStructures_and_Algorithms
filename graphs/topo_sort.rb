def topo_sort(nodes)
  sorted_nodes = []

  nodes.each do |node|
    visit(node) unless node.discovered
  end

  sorted_nodes
end
