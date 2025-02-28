import 'package:flutter_app1/home/models/product.dart';

class ProductRepository {
  Future<List<Product>> getTopRatedProducts() async {
    try {
      // For demo purposes, returning mock data
      return [
        Product(
          id: 1,
          name: 'LG전자 스탠바이미 27ART10AKPL',
          brand: 'LG전자',
          imageUrl: 'assets/images/lg_stand.png',
          rating: 4.89,
          reviewCount: 216,
          features: ['화면을 이동할 수 있고 전환도 편리하다!', '스탠바이미는 사랑입니다!'],
          category: '편리성',
        ),
        Product(
          id: 2,
          name: 'LG전자 울트라HD 75UP8300KNA',
          brand: 'LG전자',
          imageUrl: 'assets/images/lg_tv.png',
          rating: 4.36,
          reviewCount: 136,
          specs: '189cm(75인치)',
          features: ['화면 잘 나오고...리모컨 기능 좋습니다!', '넷플 아마존 등 네트워크나 바로 접속되어 좋아요'],
          category: '고화질',
        ),
        Product(
          id: 3,
          name: '라익미 스마트 DS4001L NETRANGE (스탠드)GX30K WIN10 (SSD 256GB)',
          brand: 'LG전자',
          imageUrl: 'assets/images/smarttv.png',
          rating: 3.96,
          reviewCount: 98,
          specs: '189cm(75인치)',
          features: [
            '반응속도 및 화질이나 여러면에서도 부족함을  느끼기에는 커녕 이정도에 이 정도 성능이면차고 넘칠만 합니다',
            '중소기업TV 라익미 제품을 사용해보았는데 뛰어난 가성비와 더불어OTT 서비스에 오픈 브라우저 까지 너무 마음에 들게끔 기능들을 사용 가능했고',
          ],
          category: '라익미',
        ),
      ];
    } catch (e) {
      throw Exception('Failed to load products: ${e.toString()}');
    }
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      // For demo, returning the same mock data
      return await getTopRatedProducts();
    } catch (e) {
      throw Exception('Failed to load products: ${e.toString()}');
    }
  }
}
