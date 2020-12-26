import 'dart:async';
import 'dart:io';
import 'package:dreeze_tv/Size_Config/Config.dart';
import 'package:dreeze_tv/apptheme/app_theme.dart';
import 'package:dreeze_tv/provider/notifier.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

String paystackPublicKey = 'pk_test_90c118f713846c7c39ca1afbd715813394e60f00';
class SubscriptionScreen extends StatefulWidget {
  static final routeName = '/subscription';
  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _verticalSizeBox = const SizedBox(height: 20.0);
  final _horizontalSizeBox = const SizedBox(width: 10.0);
  var _border = new Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.red,
  );
  int _radioValue = 0;
  CheckoutMethod _method;
  bool _inProgress = false;
  String _cardNumber;
  String _cvv;
  int _expiryMonth = 0;
  int _expiryYear = 0;
  @override
  void initState() {
    PaystackPlugin.initialize(publicKey: paystackPublicKey);
    print('initialise');
    super.initState();
  }
  bool handleKey(FocusNode node, RawKeyEvent key) {
    //print("Event runtimeType is ${key.runtimeType.toString()}");
    if(key.runtimeType.toString() == 'RawKeyUpEvent'){

      RawKeyEventDataAndroid data = key.data as RawKeyEventDataAndroid;
      String _keyCode;
      _keyCode = data.keyCode.toString(); //

      //    print("why does this run twice $_keyCode");
      if(data.keyCode ==22){
        print('right');
        // if(pageFocus >= 0){
        //
        //   final x =  Provider.of<SideNotifier>(context, listen: false).openit;
        //   if(x){
        //     Provider.of<SideNotifier>(context, listen: false).changeopen();
        //   }
        //
        //
        // }
      }else if(data.keyCode ==21){

        // if(pageFocus == 0){
        //   final y =  Provider.of<SideNotifier>(context, listen: false).openit;
        //   final position = Provider.of<SideNotifier>(context, listen: false).x;
        //   print('$position po');
        //   if(!y){
        //     Provider.of<SideNotifier>(context, listen: false).changeopen();
        //   }
        //
        //
        // }

      }else if(data.keyCode ==19){
        print('up');
        final y =  Provider.of<SideNotifier>(context, listen: false).openit;
        if(y){
          Provider.of<SideNotifier>(context, listen: false).changeview(3);


        }else{
          setState(() {
            // if(verticalCounter < contents.length -1){
            //   verticalCounter++;
            //   controller.jumpToPage(verticalCounter);
            // }


          });}


      }else if (data.keyCode ==20){

        //up for page view

        final y =  Provider.of<SideNotifier>(context, listen: false).openit;

        if(y){
          //    print('open $opennum');
          Provider.of<SideNotifier>(context, listen: false).changeview(5);
          //   print('open $opennum');

          //print('open $opennum');
          //opennum =1;
          // Provider.of<SideNotifier>(context, listen: false).changeview();





        }else{
          setState(() {
            // if(verticalCounter < contents.length -1){
            //   verticalCounter++;
            //   controller.jumpToPage(verticalCounter);
            // }


          });}
      }

      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    print('building');
    return new Scaffold(
       key: _scaffoldKey,
      backgroundColor: appThemeDark.backgroundColor,
      body: Focus(
        onKey: handleKey,
        autofocus: true,
        child: new Container(
          color:appThemeDark.backgroundColor,

          padding: const EdgeInsets.all(20.0),
          child: new SingleChildScrollView(
            child: new ListBody(

              children: <Widget>[
               Focus(
                 autofocus: true,

                   child: Container(child: Center(child: new Text('Our Great Deal Jump on them.')))),
                SizedBox(height: Config.yMargin(context, 5),),

                Container(child: Center(child: new Text('SUBSCRIPTION.'))),

                SizedBox(height: Config.yMargin(context, 5),),
                Center(
                  child: Container(
                   // padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    color: appThemeDark.backgroundColor,
                    width: Config.xMargin(context, 48),
                    height: Config.yMargin(context, 47),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Starter Package', style: appThemeDark.textTheme.title,),
                        SizedBox(height: Config.yMargin(context, 1),),
                        Container(
                          height: Config.yMargin(context, 40),
                          child: ListView(
                            // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              InkWell(
                                child: new Card(
                                  child: Container(
                                      height: Config.yMargin(context, 40),
                                      width: Config.xMargin(context, 15),
                                      child: Center(child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('1month'),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('#', style: appThemeDark.textTheme.display1,),
                                              Text('1000', style: appThemeDark.textTheme.subhead,),
                                            ],
                                          ),
                                          Text('Description')

                                        ],
                                      ))),

                                ),
                                onTap: (){

                                  _handleCheckout(context, 100000);
                                },
                              ),
                              InkWell(
                                child: new Card(
                                  child: Container(
                                      width: Config.xMargin(context, 15),
                                      height: Config.yMargin(context, 40),
                                      child: Center(child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('1month'),
                                          Text('1000'),
                                          Text('Description')

                                        ],
                                      ))),

                                ),
                                onTap: (){

                                  _handleCheckout(context, 100000);
                                },
                              ),
                              InkWell(
                                child: new Card(
                                  child: Container(
                                      width: Config.xMargin(context, 15),
                                      height: Config.yMargin(context, 40),
                                      child: Center(child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('1month'),
                                          Text('1000'),
                                          Text('Description')

                                        ],
                                      ))),

                                ),
                                onTap: (){

                                  _handleCheckout(context, 100000);
                                },
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Config.yMargin(context, 5),),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    color: appThemeDark.backgroundColor,
                    width: Config.xMargin(context, 48),
                    height: Config.yMargin(context, 47),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Bumper Package', style: appThemeDark.textTheme.title,),
                        SizedBox(height: Config.yMargin(context, 1),),
                        Container(
                          height: Config.yMargin(context, 40),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              InkWell(
                                child: new Card(
                                  child: Container(
                                      height: Config.yMargin(context, 40),
                                      width: Config.xMargin(context, 15),
                                      child: Center(child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('1month'),
                                          Text('1000'),
                                          Text('Description')

                                        ],
                                      ))),

                                ),
                                onTap: (){

                                  _handleCheckout(context, 100000);
                                },
                              ),
                              InkWell(
                                child: new Card(
                                  child: Container(
                                      height: Config.yMargin(context, 40),
                                      width: Config.xMargin(context, 15),
                                      child: Center(child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('1month'),
                                          Text('1000'),
                                          Text('Description')

                                        ],
                                      ))),

                                ),
                                onTap: (){

                                  _handleCheckout(context, 100000);
                                },
                              ),
                              InkWell(
                                child: new Card(
                                  child: Container(
                                      height: Config.yMargin(context, 40),
                                      width: Config.xMargin(context, 15),
                                      child: Center(child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('1month'),
                                          Text('1000'),
                                          Text('Description')

                                        ],
                                      ))),

                                ),
                                onTap: (){

                                  _handleCheckout(context, 100000);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Config.yMargin(context, 5),),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    color: appThemeDark.backgroundColor,
                    width: Config.xMargin(context, 48),
                    height: Config.yMargin(context, 45),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(child: Text('Jumbo Package',style: appThemeDark.textTheme.title,)),
                        SizedBox(height: Config.yMargin(context, 1),),
                        Container(
                          height: Config.yMargin(context, 40),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              InkWell(
                                child: new Card(
                                  child: Container(
                                      height: Config.yMargin(context, 40),
                                      width: Config.xMargin(context, 15),
                                      child: Center(child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('1month'),
                                          Text('1000'),
                                          Text('Description')

                                        ],
                                      ))),

                                ),
                                onTap: (){

                                  _handleCheckout(context, 100000);
                                },
                              ),
                              InkWell(
                                child: new Card(
                                  child: Container(
                                      height: Config.yMargin(context, 40),
                                      width: Config.xMargin(context, 15),
                                      child: Center(child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('1month'),
                                          Text('1000'),
                                          Text('Description')

                                        ],
                                      ))),

                                ),
                                onTap: (){

                                  _handleCheckout(context, 100000);
                                },
                              ),
                              InkWell(
                                child: new Card(
                                  child: Container(
                                      height: Config.yMargin(context, 40),
                                      width: Config.xMargin(context, 15),
                                      child: Center(child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('1month'),
                                          Text('1000'),
                                          Text('Description')

                                        ],
                                      ))),

                                ),
                                onTap: (){

                                  _handleCheckout(context, 100000);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Config.yMargin(context, 5),),
                // _verticalSizeBox,
                // new TextFormField(
                //   decoration: const InputDecoration(
                //     border: const UnderlineInputBorder(),
                //     labelText: 'Card number',
                //   ),
                //   onSaved: (String value) => _cardNumber = value,
                // ),
                // _verticalSizeBox,
                // new Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: <Widget>[
                //     new Expanded(
                //       child: new TextFormField(
                //         decoration: const InputDecoration(
                //           border: const UnderlineInputBorder(),
                //           labelText: 'CVV',
                //         ),
                //         onSaved: (String value) => _cvv = value,
                //       ),
                //     ),
                //     _horizontalSizeBox,
                //     new Expanded(
                //       child: new TextFormField(
                //         decoration: const InputDecoration(
                //           border: const UnderlineInputBorder(),
                //           labelText: 'Expiry Month',
                //         ),
                //         onSaved: (String value) =>
                //         _expiryMonth = int.tryParse(value),
                //       ),
                //     ),
                //     _horizontalSizeBox,
                //     new Expanded(
                //       child: new TextFormField(
                //         decoration: const InputDecoration(
                //           border: const UnderlineInputBorder(),
                //           labelText: 'Expiry Year',
                //         ),
                //         onSaved: (String value) =>
                //         _expiryYear = int.tryParse(value),
                //       ),
                //     )
                //   ],
                // ),
                // _verticalSizeBox,
                // Theme(
                //   data: Theme.of(context).copyWith(
                //     accentColor: green,
                //     primaryColorLight: Colors.white,
                //     primaryColorDark: navyBlue,
                //     textTheme: Theme.of(context).textTheme.copyWith(
                //       bodyText2: TextStyle(
                //         color: lightBlue,
                //       ),
                //     ),
                //   ),
                //   child: Builder(
                //     builder: (context) {
                //       return  new Column(
                //         mainAxisSize: MainAxisSize.min,
                //         children: <Widget>[
                //           _border,
                //           new SizedBox(
                //             height: 40.0,
                //           ),
                //           new Row(
                //             mainAxisAlignment:
                //             MainAxisAlignment.spaceBetween,
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: <Widget>[
                //               // new Flexible(
                //               //   flex: 3,
                //               //   child: new DropdownButtonHideUnderline(
                //               //     child: new InputDecorator(
                //               //       decoration: const InputDecoration(
                //               //         border: OutlineInputBorder(),
                //               //         isDense: true,
                //               //         hintText: 'Checkout method',
                //               //       ),
                //               //       isEmpty: _method == null,
                //               //       child: new DropdownButton<
                //               //           CheckoutMethod>(
                //               //         value: _method,
                //               //         isDense: true,
                //               //         onChanged: (CheckoutMethod value) {
                //               //           setState(() {
                //               //             _method = value;
                //               //           });
                //               //         },
                //               //         items: banks.map((String value) {
                //               //           return new DropdownMenuItem<
                //               //               CheckoutMethod>(
                //               //             value:
                //               //             _parseStringToMethod(value),
                //               //             child: new Text(value),
                //               //           );
                //               //         }).toList(),
                //               //       ),
                //               //     ),
                //               //   ),
                //               // ),
                //               _horizontalSizeBox,
                //               new Flexible(
                //                 flex: 2,
                //                 child: new Container(
                //                   width: double.infinity,
                //                   child: _getPlatformButton(
                //                     'Checkout',
                //                         () => _handleCheckout(context),
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           )
                //         ],
                //       );
                //     },
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleRadioValueChanged(int value) =>
      setState(() => _radioValue = value);

  _handleCheckout(BuildContext context, int price) async {
    // if (_method == null) {
    //   _showMessage('Select checkout method first');
    //   return;
    // }

    // if (_method != CheckoutMethod.card && _isLocal) {
    //   _showMessage('Select server initialization method at the top');
    //   return;
    // }
    setState(() => _inProgress = true);
    Charge charge = Charge()
      ..amount = price // In base currency
      ..email = 'customer@email.com';
  //    ..card = _getCardFromUI();

    if (!_isLocal) {
      // var accessCode = await _fetchAccessCodeFrmServer(_getReference());
      // charge.accessCode = accessCode;
    } else {
      charge.reference = _getReference();
    }

    try {
      CheckoutResponse response = await PaystackPlugin.checkout(
        context,
        method: _method,
        charge: charge,
        fullscreen: false,
        logo: MyLogo(),
      );
      print('Response = $response');
      setState(() => _inProgress = false);
      _updateStatus(response.reference, '$response');
    } catch (e) {
      setState(() => _inProgress = false);
      _showMessage("Check console for error");
      rethrow;
    }
  }

  _startAfreshCharge() async {
    _formKey.currentState.save();

    Charge charge = Charge();
    charge.card = _getCardFromUI();

    setState(() => _inProgress = true);

    if (_isLocal) {
      // Set transaction params directly in app (note that these params
      // are only used if an access_code is not set. In debug mode,
      // setting them after setting an access code would throw an exception

      charge
        ..amount = 10000 // In base currency
        ..email = 'customer@email.com'
        ..reference = _getReference()
        ..putCustomField('Charged From', 'Flutter SDK');
      _chargeCard(charge);
    } else {
      // Perform transaction/initialize on Paystack server to get an access code
      // documentation: https://developers.paystack.co/reference#initialize-a-transaction
      // charge.accessCode = await _fetchAccessCodeFrmServer(_getReference());
      // _chargeCard(charge);
    }
  }

  _chargeCard(Charge charge) async {
    final response = await PaystackPlugin.chargeCard(context, charge: charge);

    final reference = response.reference;

    // Checking if the transaction is successful
    if (response.status) {
      print(response.status);
     // _verifyOnServer(reference);
      return;
    }

    // The transaction failed. Checking if we should verify the transaction
    if (response.verify) {
    //  _verifyOnServer(reference);
    } else {
      setState(() => _inProgress = false);
      _updateStatus(reference, response.message);
    }
  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  PaymentCard _getCardFromUI() {
    // Using just the must-required parameters.
    return PaymentCard(
      number: _cardNumber,
      cvc: _cvv,
      expiryMonth: _expiryMonth,
      expiryYear: _expiryYear,
    );

    // Using Cascade notation (similar to Java's builder pattern)
//    return PaymentCard(
//        number: cardNumber,
//        cvc: cvv,
//        expiryMonth: expiryMonth,
//        expiryYear: expiryYear)
//      ..name = 'Segun Chukwuma Adamu'
//      ..country = 'Nigeria'
//      ..addressLine1 = 'Ikeja, Lagos'
//      ..addressPostalCode = '100001';

    // Using optional parameters
//    return PaymentCard(
//        number: cardNumber,
//        cvc: cvv,
//        expiryMonth: expiryMonth,
//        expiryYear: expiryYear,
//        name: 'Ismail Adebola Emeka',
//        addressCountry: 'Nigeria',
//        addressLine1: '90, Nnebisi Road, Asaba, Deleta State');
  }

  Widget _getPlatformButton(String string, Function() function) {
    // is still in progress
    Widget widget;
    if (Platform.isIOS) {
      widget = new CupertinoButton(
        onPressed: function,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        color: CupertinoColors.activeBlue,
        child: new Text(
          string,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    } else {
      widget = new RaisedButton(
        onPressed: function,
        color: Colors.blueAccent,
        textColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
        child: new Text(
          string.toUpperCase(),
          style: const TextStyle(fontSize: 17.0),
        ),
      );
    }
    return widget;
  }

  // Future<String> _fetchAccessCodeFrmServer(String reference) async {
  //   String url = '$backendUrl/new-access-code';
  //   String accessCode;
  //   try {
  //     print("Access code url = $url");
  //     http.Response response = await http.get(url);
  //     accessCode = response.body;
  //     print('Response for access code = $accessCode');
  //   } catch (e) {
  //     setState(() => _inProgress = false);
  //     _updateStatus(
  //         reference,
  //         'There was a problem getting a new access code form'
  //             ' the backend: $e');
  //   }
  //
  //   return accessCode;
  // }

  // void _verifyOnServer(String reference) async {
  //   _updateStatus(reference, 'Verifying...');
  //   String url = '$backendUrl/verify/$reference';
  //   try {
  //     http.Response response = await http.get(url);
  //     var body = response.body;
  //     _updateStatus(reference, body);
  //   } catch (e) {
  //     _updateStatus(
  //         reference,
  //         'There was a problem verifying %s on the backend: '
  //             '$reference $e');
  //   }
  //   setState(() => _inProgress = false);
  // }

  _updateStatus(String reference, String message) {
    _showMessage('Reference: $reference \n\ Response: $message',
        const Duration(seconds: 7));
  }

  _showMessage(String message,
      [Duration duration = const Duration(seconds: 4)]) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(message),
      duration: duration,
      action: new SnackBarAction(
          label: 'CLOSE',
          onPressed: () => _scaffoldKey.currentState.removeCurrentSnackBar()),
    ));
  }

  bool get _isLocal => _radioValue == 0;
}

var banks = ['Selectable', 'Bank', 'Card'];

CheckoutMethod _parseStringToMethod(String string) {
  CheckoutMethod method = CheckoutMethod.selectable;
  switch (string) {
    case 'Bank':
      method = CheckoutMethod.bank;
      break;
    case 'Card':
      method = CheckoutMethod.card;
      break;
  }
  return method;
}

class MyLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: Text(
        "CO",
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

const Color green = const Color(0xFF3db76d);
const Color lightBlue = const Color(0xFF34a5db);
const Color navyBlue = const Color(0xFF031b33);



