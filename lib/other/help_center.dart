import 'package:flutter/material.dart';

class HelpCenter extends StatelessWidget {
  final List<Map<String, String>> faqList = [
    {
      "question": "How can I order clothes?",
      "answer":
          "You can browse the catalog, select your desired items, add them to your cart, and proceed to checkout."
    },
    {
      "question": "What payment methods are accepted?",
      "answer":
          "We accept various payment methods, including credit cards, PayPal, and mobile payments."
    },
    {
      "question": "Can I return or exchange items?",
      "answer":
          "Yes, items can be returned or exchanged within 30 days, provided they are in their original condition."
    },
    {
      "question": "How do I track my order?",
      "answer":
          "Once your order is shipped, you'll receive a tracking number to check the delivery status."
    },
    {
      "question": "What if the item I want is out of stock?",
      "answer":
          "You can sign up for restock notifications, and we’ll notify you when the item is back in stock."
    },
    {
      "question": "How can I order clothes?",
      "answer":
          "You can browse the catalog, select your desired items, add them to your cart, and proceed to checkout."
    },
    {
      "question": "What payment methods are accepted?",
      "answer":
          "We accept various payment methods, including credit cards, PayPal, and mobile payments."
    },
    {
      "question": "Can I return or exchange items?",
      "answer":
          "Yes, items can be returned or exchanged within 30 days, provided they are in their original condition."
    },
    {
      "question": "Are there any shipping fees?",
      "answer":
          "Shipping fees vary based on location and order size. Free shipping is available for orders over a certain amount."
    },
    {
      "question": "How long does delivery take?",
      "answer":
          "Delivery usually takes 3-5 business days, depending on your location."
    },
    {
      "question": "How can I contact customer support?",
      "answer":
          "You can reach out to us through the Contact Us page, or email us at support@fashionhub.com."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
      ),
      body: ListView.builder(
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(faqList[index]['question']!),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(faqList[index]['answer']!),
              ),
            ],
          );
        },
      ),
    );
  }
}
