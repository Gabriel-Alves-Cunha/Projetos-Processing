Tree tree;

void setup() {
  size(600, 400);
  
  tree = new Tree();
  Node n = new Node(5);
  tree.addNode(n);
  
  print(tree);
}

void draw() {
}
