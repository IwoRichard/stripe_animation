import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: 'Stripe',
              style: GoogleFonts.outfit(
                color: Colors.black.withOpacity(.7),
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
              children: [
                TextSpan(
                  text: ' SESSION',
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  )
                )
              ]
            )
          ),
          const Spacer(),
          Row(
            children: [
              TextButton(
                onPressed: (){},
                child: Text(
                  'Info',
                  style: GoogleFonts.outfit(
                    color: Colors.black.withOpacity(.8),
                    fontWeight: FontWeight.w500,
                  ),
                )
              ),
              TextButton(
                onPressed: (){},
                child: Text(
                  'Talks',
                  style: GoogleFonts.outfit(
                    color: Colors.black.withOpacity(.8),
                    fontWeight: FontWeight.w500,
                  ),
                )
              ),
              TextButton(
                onPressed: (){},
                child: Text(
                  'Speakers',
                  style: GoogleFonts.outfit(
                    color: Colors.black.withOpacity(.8),
                    fontWeight: FontWeight.w500,
                  ),
                )
              ),
              TextButton(
                onPressed: (){},
                child: Text(
                  'Sponsors',
                  style: GoogleFonts.outfit(
                    color: Colors.black.withOpacity(.8),
                    fontWeight: FontWeight.w500,
                  ),
                )
              ),
            ],
          ),
          const Spacer(),
          MaterialButton(
            onPressed: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blueAccent,
                    Colors.purpleAccent,
                  ],
                ),
              ),
              child:Text(
                'Register',
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                )
            ),
          )
        ],
      ),
    );
  }
}

