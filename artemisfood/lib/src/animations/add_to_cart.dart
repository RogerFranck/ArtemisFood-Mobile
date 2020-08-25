import 'package:artemisfood/src/model/producto.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedDialogFood extends StatefulWidget {
  const AnimatedDialogFood({Key key, @required this.producto})
      : super(key: key);

  final Producto producto;

  @override
  AnimatedDialogFoodState createState() => AnimatedDialogFoodState();
}

int _elementoSeleccionado;
const _separador = SizedBox(height: 20.0);

class AnimatedDialogFoodState extends State<AnimatedDialogFood> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation _animationInitialized;
  Animation _rotatedCart1;
  Animation _rotatedCart2;
  Animation _dropProduct;
  Animation _animationFinished;
  double _iconSize = 100.0;
  double _minImageSize = 15.0;
  double _imageSize = 50.0;
  double _number = 350.0;

  @override
  void initState() {
     _elementoSeleccionado = 1;
      _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _animationInitialized = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.35,
        ),
      ),
    );
    _rotatedCart1 = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.3,
          0.4,
        ),
      ),
    );
    _rotatedCart2 = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.4,
          0.6,
        ),
      ),
    );
    _dropProduct = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.6,
          0.7,
          curve: Curves.easeIn
        ),
      ),
    );
    _animationFinished =  Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.75,
          1,
          curve: Curves.easeInBack,
        ),
      ),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
       Navigator.of(context).pop(); 
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    final Size _size = MediaQuery.of(context).size;
    double _maxIconPosition = _size.width / 2 - _iconSize / 2;
    double _minIconPosition = -(_iconSize * 2);
    double _preferedAngle = .5;
    double _maxHeight = _size.height * 0.45;
    double _maxWidth = _size.width * 0.8;
    double _minSize = 30.0;

    return Material(
      color: Colors.transparent,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          double height = (_maxHeight - (_animationInitialized.value * _number)).clamp(_minSize, _maxHeight);
          double width = (_maxWidth - (_animationInitialized.value * _number)).clamp(_minSize, _maxWidth);
          
          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    color: Colors.black38,
                  ),
                ),
              ),
              Positioned(
                bottom: ((_size.height / 2 - height / 2) - (_dropProduct.value * _number)).clamp(140.0, (_size.height / 2 - height / 2)),
                left: _size.width / 2 - width / 2 + (_animationFinished.value * _number),
                child: Container(
                  alignment: Alignment.center,
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular((25 * (_animationInitialized.value * _number)).clamp(25.0, 180.0)),
                  ),
                  child: Padding(
                    padding: height < 200 ? const EdgeInsets.symmetric(vertical: 0) : const EdgeInsets.symmetric(vertical: 20),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius:  (_imageSize - (_animationInitialized.value * _number)).clamp(_minImageSize, _imageSize),
                            backgroundImage: NetworkImage(widget.producto.foto),
                          ),
                          if (_animationInitialized.value == 0) ...[
                            _separador,
                            ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (bounds) {
                                return RadialGradient(
                                  center: Alignment.bottomRight,
                                  radius: 1.0,
                                  colors: <Color>[Colors.pink.withOpacity(0.5), primaryColor],
                                  tileMode: TileMode.mirror,
                                ).createShader(bounds);
                              },
                              child: Text(
                                widget.producto.nombre,
                                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                            _separador,
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Cantidad deseada', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),),
                                  DropdownButton(
                                    value: _elementoSeleccionado,
                                    onChanged: (val) {
                                      setState(() {
                                        _elementoSeleccionado = val;
                                      });
                                    },
                                    items: [
                                      _customDropdown('1', 1),
                                      _customDropdown('2', 2),
                                      _customDropdown('3', 3),
                                      _customDropdown('4', 4),
                                      _customDropdown('5', 5),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            _separador,
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Costo', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),),
                                  Text('\$${(widget.producto.precio * _elementoSeleccionado).toDouble()}', style: TextStyle(fontSize: 16.0, color: primaryColor, fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                            _separador,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(30.0),
                                  splashColor: primaryColor.withOpacity(0.4),
                                  onTap: () {
                                    _controller.forward();
                                    appBloc.pushToCart(widget.producto);
                                    appBloc.getTotal();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Aceptar', style: TextStyle(color: Colors.green[400], fontSize: 18.0, fontWeight: FontWeight.w500),),
                                  ),
                                ),
                                const SizedBox(width: 25.0),
                                _boton(
                                  'Cancelar', 
                                  Colors.red[400],
                                  () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: (_minIconPosition + (_animationInitialized.value * _number)).clamp(_minIconPosition, _maxIconPosition) 
                                                                                    + (_animationFinished.value * _number),
                bottom: 100,
                child: Transform.rotate(
                  angle: (_preferedAngle * _rotatedCart1.value).clamp(0.0, _preferedAngle) * _rotatedCart2.value,
                  child: Image.asset(
                    '$iconPath/cart.png',
                    width: _iconSize,
                    height: _iconSize,
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}

  Widget _boton(String texto, Color color, VoidCallback onTap)  {
    

    return InkWell(
      borderRadius: BorderRadius.circular(30.0),
      splashColor: primaryColor.withOpacity(0.4),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(texto, style: TextStyle(color: color, fontSize: 18.0, fontWeight: FontWeight.w500),),
      ),
    );
  }

  DropdownMenuItem _customDropdown(String text, int value) {
    
    return DropdownMenuItem(
      child: Text(text),
      value: value,
      onTap: () {},
    );
  }