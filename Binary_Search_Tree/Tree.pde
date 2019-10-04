class Tree {
  Node root;

  Tree(){
    root = null;
  }
  
  void addNode(Node n){
    if(root == null){
      root = n;
    }
  }
}
