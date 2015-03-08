require_relative 'undirected_graph'

class vertex
def bfs(graph, node)
  queue = [node]
  node.discovered = true

  until queue.empty?
    node = queue.shift

  end
  # until nodes.empty?
  #   node = nodes.shift
  #
  #   return node if node == target_node
  #   nodes.concat(node.children)
  # end
  #
  # nil
end
