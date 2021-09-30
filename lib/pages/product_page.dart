import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myfood_delivery/components/image_loader.dart';
import 'package:myfood_delivery/components/select_optional_widget.dart';
import 'package:myfood_delivery/components/text_input.dart';
import 'package:myfood_delivery/controllers/product_controller.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductController _productController = Get.put(ProductController());

  @override
  void initState() {
    WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
    binding.addPostFrameCallback((_) => changeSB());
    super.initState();
  }

  void changeSB() async {
    await Future.delayed(Duration(milliseconds: 100));
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Obx(
          () => Text(
            _productController.product.title ?? '',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.favorite_outline),
          ),
        ],
      ),
      body: GetX<ProductController>(
        // init: ProductController(),
        builder: (_) {
          if (_.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (_.hasError) {
            return Center(child: Text('Ops, erro ao carregar o produto :('));
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: ImageLoader(
                      src: _.product.picture!,
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    _.product.description ?? '',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SelectOptionalWidget(choices: _.product.choices!),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('Alguma observação?'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextInput(
                    borderColor: Colors.grey.shade300,
                    hintText: 'Ex: Retirar cebola, ponto da carne etc.',
                  ),
                ),
                ElevatedButton(onPressed: () => {}, child: Text('Comprar')),
              ],
            ),
          );
        },
      ),
    );
  }
}
