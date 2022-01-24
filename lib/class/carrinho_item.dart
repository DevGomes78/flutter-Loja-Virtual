

class CartItem{
  final int id;
  final String produtoId;
  final String nome;
  final int qtde;
  final String preco;
  final String img;
  
  CartItem({
    required this.id,
    required this.produtoId,
    required this.nome,
    required this.qtde,
    required this.preco,
    required this.img,
  });
}