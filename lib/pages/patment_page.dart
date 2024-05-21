import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delevery_app/components/my_button.dart';
import 'package:food_delevery_app/pages/delevery_progress.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = " ";
  String cardHolderName = " ";
  String expiryDate = " ";
  String cvvCode = " ";
  bool isCvvFocus = false;


  @override
  Widget build(BuildContext context) {

    
  final style = TextStyle(
    color: Theme.of(context).colorScheme.primary,
    fontSize: 18
  );

  validatePayment(){
     
     showDialog(context: context,
      builder: (context)=> AlertDialog(
          title:const Text("Confirm your payment?"),
          content: SingleChildScrollView(
            child: ListBody(children: [
              Text("Card Number: $cardNumber",style: style,),
              Text("Expire Date: $expiryDate",style: style,),
              Text("Card holder name: $cardHolderName",style: style,),
              Text("ccv: $cvvCode",style: style,),
            ],),
          ),
          actions: [
            TextButton(onPressed: (){
                Navigator.pop(context);
            }, child:const Text("No")),
            TextButton(onPressed: (){
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const DeliveryProgress()));
            }, child:const Text("Yes")),
          ],
      ));
  
  }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("CheckOut"),
        centerTitle: true,
      ),
      body: 
         Column(
          children: [
            // creadit card
            // CreditCardWidget(
            //     cardNumber: cardNumber,
            //     expiryDate: expiryDate,
            //     cardHolderName: cardHolderName,
            //     cvvCode: cvvCode,
            //     showBackView: isCvvFocus,
            //     onCreditCardWidgetChange: (p0) {}),
            // credit card form
            CreditCardForm(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: (data){
                  setState(() {
                    cardNumber = data.cardNumber;
                    expiryDate = data.expiryDate;
                    cardHolderName = data.cardHolderName;
                    cvvCode = data.cvvCode;
                  
                  });
                },
                formKey: formKey),
              const  Spacer(),
              MyButton(onTap: (){
                validatePayment();
              }, text: "Pay now")
          ],
        ),
      
    );
  }
}
