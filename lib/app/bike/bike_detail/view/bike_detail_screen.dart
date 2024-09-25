import 'package:flutter/material.dart';
import '../../../../core/base/base_screen.dart';
import '../../../../core/init/constants/image/image_constants.dart';
import '../../../../core/widgets/template_screen.dart';
import '../view_model/bike_detail_view.dart';

class BikeDetailScreen extends StatelessWidget {
  const BikeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      onInit: (viewmodel) {},
      viewmodel: BikeDetailView(context: context),
      builder: (context, viewmodel, child, deviceScreen) {
        return BuildTemplateMain(
          imageBackground: ImageConstants.instance.backgrouniconAJ,
          paddingScreen: EdgeInsets.zero,
          showAppbar: true,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: _buildMainBody(context),
          ),
        );
      },
    );
  }

  Widget _buildMainBody(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildBikeImageSection(),
            Column(
              children: [
                _buildDetailRow('Model', 'GODDESS'),
                const SizedBox(height: 10),
                _buildDetailRow('Color', 'STEEL GREY'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        const SizedBox(height: 20),
        _buildDetailItem('ชื่อ-นามสกุล', 'รนวัฒน์ ทองทับ'),
        _buildDetailItem('วันที่ซื้อขาย', '20 พฤศจิกายน พ.ศ. 2567'),
        _buildDetailItem('เบอร์โทรศัพท์', '098 888 9999'),
        _buildDetailItem('เลขทะเบียนรถ', '-'),
        _buildDetailItem('เลขตัวถัง', 'ML2S2500S2P00999'),
        _buildDetailItem('เลขมอเตอร์', '7041248456'),
        _buildDetailItem('เลขแบตเตอรี่', 'AP899S'),
        _buildDetailItem('ร้านที่จำหน่าย', 'EV ZERO (อีวี ซีโร่)'),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildBikeImageSection() {
    return Column(
      children: [
        Image.asset(
          ImageConstants.instance.evbikenone,
          width: 230,
          height: 220,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            // ใช้ LinearGradient เพื่อปรับพื้นหลังของ Container
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFD9D9D9), // สีเทาอ่อน #D9D9D9
                Color(0xFFFFFFFF), // สีขาว #FFFFFF
                Color(0xFFD9D9D9), // สีเทาอ่อน #D9D9D9
              ],
              stops: [0.0, 0.5, 1.0], // ตำแหน่งของสีใน Gradient
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              Text(
                value,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        width: double.infinity,
        decoration: BoxDecoration(
          // ใช้ LinearGradient เพื่อปรับพื้นหลังของ Container
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFD9D9D9), // สีเทาอ่อน #D9D9D9
              Color(0xFFFFFFFF), // สีขาว #FFFFFF
              Color(0xFFD9D9D9), // สีเทาอ่อน #D9D9D9
            ],
            stops: [0.0, 0.5, 1.0], // ตำแหน่งของสีใน Gradient
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
