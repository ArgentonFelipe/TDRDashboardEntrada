enum OrderStatus {
  begin(description: 'Inicio', type: 0),
  finished(description: 'Encerrada', type: 1),
  canceled(description: 'Cancelada', type: 2),
  transfered(description: 'Transferida', type: 3),
  reversed(description: 'Estornada', type: 4),
  confered(description: 'Conferida', type: 5),
  unknown(description: 'Desconhecido', type: 99);

  const OrderStatus({required this.type, required this.description});

  final int type;
  final String description;

  static OrderStatus getStatus(int status) {
    switch (status) {
      case 0:
        return OrderStatus.begin;
      case 1:
        return OrderStatus.finished;
      case 2:
        return OrderStatus.canceled;
      case 3:
        return OrderStatus.transfered;
      case 4:
        return OrderStatus.reversed;
      case 5:
        return OrderStatus.confered;
      default:
        return OrderStatus.begin;
    }
  }
}
