import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/physics.dart';

void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Horizontal Snapping Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF3F4F6),
        fontFamily: 'Roboto',
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
        },
      ),
      home: const AccountsScreen(),
    );
  }
}

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  final List<Map<String, dynamic>> accounts = [
    {
      'id': 1,
      'isDefault': true,
      'badgeText': 'MẶC ĐỊNH',
      'badgeColor': const Color(0xFF10B981),
      'badgeBg': const Color(0xFF10B981),
      'badgeTextColor': Colors.white,
      'number': '0399827336',
      'balance': '400,000,000',
      'badgePos': 'top',
    },
    {
      'id': 2,
      'isDefault': false,
      'badgeText': 'TÀI KHOẢN THẤU CHI',
      'badgeColor': const Color(0xFFBFDBFE),
      'badgeBg': const Color(0xFFEFF6FF),
      'badgeTextColor': const Color(0xFF2563EB),
      'number': '812984774421',
      'balance': '50,000,000',
      'badgePos': 'middle',
    },
    {
      'id': 3,
      'isDefault': false,
      'badgeText': 'TÀI KHOẢN LƯƠNG',
      'badgeColor': const Color(0xFFE9D5FF),
      'badgeBg': const Color(0xFFFAF5FF),
      'badgeTextColor': const Color(0xFF9333EA),
      'number': '41361364778',
      'balance': '100,000,000',
      'badgePos': 'middle',
    },
    {
      'id': 4,
      'isDefault': false,
      'badgeText': 'TÀI KHOẢN TÍCH LŨY',
      'badgeColor': const Color(0xFFFDE68A),
      'badgeBg': const Color(0xFFFFFBEB),
      'badgeTextColor': const Color(0xFFD97706),
      'number': '92736188223',
      'balance': '25,000,000',
      'badgePos': 'middle',
    },
    {
      'id': 5,
      'isDefault': false,
      'badgeText': 'TÀI KHOẢN TIẾT KIỆM',
      'badgeColor': const Color(0xFFFECDD3),
      'badgeBg': const Color(0xFFFFF1F2),
      'badgeTextColor': const Color(0xFFE11D48),
      'number': '55612300941',
      'balance': '150,000,000',
      'badgePos': 'middle',
    },
    {
      'id': 6,
      'isDefault': false,
      'badgeText': 'THẺ TÍN DỤNG',
      'badgeColor': const Color(0xFFC7D2FE),
      'badgeBg': const Color(0xFFEEF2FF),
      'badgeTextColor': const Color(0xFF4F46E5),
      'number': '4221 88xx xxxx 1234',
      'balance': '50,000,000',
      'badgePos': 'middle',
    },
    {
      'id': 7,
      'isDefault': false,
      'badgeText': 'VAY TIÊU DÙNG',
      'badgeColor': const Color(0xFFCBD5E1),
      'badgeBg': const Color(0xFFF8FAFC),
      'badgeTextColor': const Color(0xFF334155),
      'number': '09912837466',
      'balance': '-12,500,000',
      'badgePos': 'middle',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Container(
          width: 390,
          height: 844,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.black, width: 8),
          ),
          child: Column(
            children: [
              // Top Header
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left, color: Colors.blue),
                      onPressed: () {},
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.notifications_none, color: Colors.black54),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.home_outlined, color: Colors.black54),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Tài khoản',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      
                      // Currency Tabs
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)
                                    ],
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text('VND', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                                ),
                              ),
                              const Expanded(
                                child: Center(
                                  child: Text('Ngoại tệ', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Main Account Area
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F8FC),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.blue.withOpacity(0.05)),
                          boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 12, offset: const Offset(0, 2))
                          ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Balance
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Text('Số dư tài khoản', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500)),
                                      const SizedBox(width: 8),
                                      Icon(Icons.visibility_off_outlined, size: 16, color: Colors.blue[600]),
                                    ],
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF1D4ED8),
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text('7', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text('500,000,000', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, letterSpacing: -0.5)),
                                  SizedBox(width: 6),
                                  Text('VND', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Khu vực danh sách cuộn ngang với hiệu ứng bắt dính (Snapping)
                            // Sử dụng SizedBox để cố định chiều cao cho dải thẻ
                            SizedBox(
                              height: 130,
                              // OverflowBox cho phép ListView mở rộng vượt ra ngoài margin(16) của Container cha
                              // Nhờ vậy, ListView sẽ có chiều rộng thực tế là 390 (bằng toàn màn hình điện thoại).
                              // Điều này giải quyết lỗi "bị cắt mất thẻ (clip) ở viền trái/phải" khi cuộn!
                              child: OverflowBox(
                                maxWidth: 390,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // Sử dụng Custom Physics để:
                                  // 1. Nhận diện thao tác vuốt nhanh để có thể bay qua nhiều thẻ (vuốt mạnh nhảy nhiều thẻ).
                                  // 2. Tự động "bắt dính" (snap) vào chính xác vị trí của thẻ gần nhất khi dừng.
                                  // 252 = 240 (chiều rộng thẻ) + 12 (khoảng cách bên phải thẻ).
                                  physics: const SnappingScrollPhysics(itemWidth: 252),
                                  // Padding left 36px để thụt lùi thẻ đầu tiên vào đúng vị trí bắt đầu
                                  // Padding right 36px để thẻ cuối cùng khi cuộn hết cũng có khoảng nghỉ đẹp.
                                  padding: const EdgeInsets.only(left: 36, right: 36),
                                  // Không cắt phần hiển thị vượt quá bounds, cho phép thẻ mượt mà trôi ra khỏi mép
                                  clipBehavior: Clip.none,
                                  itemCount: accounts.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index == accounts.length) {
                                      return _buildViewAllCard();
                                    }
                                    return _buildAccountCard(accounts[index]);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountCard(Map<String, dynamic> acc) {
    bool isDefault = acc['isDefault'];
    
    return Container(
      width: 240, // Note: width here is overridden by PageView, but we keep it for reference
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDefault ? const Color(0xFF10B981) : Colors.grey.shade200,
          width: isDefault ? 2 : 1,
        ),
        boxShadow: isDefault ? [
           BoxShadow(color: const Color(0xFF10B981).withOpacity(0.2), spreadRadius: 4)
        ] : [
           BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (acc['badgePos'] == 'top') _buildBadge(acc),
              if (acc['badgePos'] == 'top') const SizedBox(height: 6),
              Text(
                acc['number'],
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
              if (acc['badgePos'] == 'middle') const SizedBox(height: 4),
              if (acc['badgePos'] == 'middle') _buildBadge(acc),
            ],
          ),
          
          Container(
            padding: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade50)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(acc['balance'], style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900)),
                const SizedBox(width: 4),
                const Text('VND', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.black54)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBadge(Map<String, dynamic> acc) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: acc['badgeBg'],
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: acc['badgeColor']),
      ),
      child: Text(
        acc['badgeText'],
        style: TextStyle(
          color: acc['badgeTextColor'],
          fontSize: 9,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildViewAllCard() {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.withOpacity(0.3), style: BorderStyle.none), // Wait, dashed border needs CustomPaint, using simple solid for now
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.chevron_right, color: Colors.blue),
              ),
              const SizedBox(height: 12),
              const Text('Xem (7) tài khoản', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black54)),
            ],
          ),
        ),
      ),
    );
  }
}

// Class quy định nguyên lý vật lý (Physics) khi cuộn
// Mục đích: Cho phép người dùng vuốt trượt theo đà qua nhiều phần tử,
// nhưng khi dừng lại, nó phải tự động 'snap' (bắt dính) vào đúng lề của phần tử gần nhất.
class SnappingScrollPhysics extends ScrollPhysics {
  final double itemWidth; // Chiều rộng chính xác của 1 thẻ + khoảng trống (gap)

  const SnappingScrollPhysics({required this.itemWidth, super.parent});

  @override
  SnappingScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return SnappingScrollPhysics(itemWidth: itemWidth, parent: buildParent(ancestor));
  }

  @override
  Simulation? createBallisticSimulation(ScrollMetrics position, double velocity) {
    // Nếu đang cuộn vượt quá giới hạn (kéo quá đầu hoặc quá cuối danh sách), 
    // giao lại việc mô phỏng độ nảy (bounce) cho class cha.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }

    final Tolerance tolerance = toleranceFor(position);
    double target = position.pixels;

    // Nếu người dùng đang vuốt với một vận tốc nhất định
    if (velocity.abs() > tolerance.velocity) {
      // Dùng FrictionSimulation để ước lượng vị trí nó sẽ dừng lại một cách tự nhiên
      final FrictionSimulation frictionSimulation = FrictionSimulation(0.15, position.pixels, velocity);
      target = frictionSimulation.finalX;
    }

    // LÀM TRÒN VỊ TRÍ ĐÍCH:
    // Ép vị trí dừng tự nhiên vào mốc gần nhất chia hết cho itemWidth (chiều rộng 1 khối)
    // Ví dụ itemWidth = 252. Vị trí tự nhiên là 600 -> nó sẽ snap về mốc 504.
    target = (target / itemWidth).roundToDouble() * itemWidth;

    // Đảm bảo không bắt dính vượt ngoài biên trái/phải
    if (target < position.minScrollExtent) {
      target = position.minScrollExtent;
    } else if (target > position.maxScrollExtent) {
      target = position.maxScrollExtent;
    }

    // Trả về một chuyển động dạng lò xo (Spring) để cuộn êm ái tới đúng điểm đích vừa tính
    return SpringSimulation(
      spring,
      position.pixels,
      target,
      velocity,
      tolerance: tolerance,
    );
  }

  @override
  bool get allowImplicitScrolling => false;
}
