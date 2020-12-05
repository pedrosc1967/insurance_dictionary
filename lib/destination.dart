import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';

// Definition of the screens
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accident"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
              '\n \nAn unexpected event or circumstance without deliberate intent. \n\n',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20)),
          Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: RaisedButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.blue[300],
              child: Text(
                "Back to Contents",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  fontSize: 22.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accident Insurance"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text('\n \nInsurance for unforeseen bodily injury. \n\n',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class FourthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accident Only"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \nAn insurance contract that provides coverage, singly or in combination, for death, dismemberment, disability, or hospital and medical care caused by or necessitated as a result of accident or specified kinds of accident. \n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class FifthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accident Only or AD&D"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \nPolicies providing coverage, singly or in combination, for death, dismemberment, disability, or hospital and medical care caused by or necessitated as a result of accident or specified kinds of accidents. Types of coverage include student accident, sports accident, travel accident, blanket accident, specific accident or accidental death and dismemberment (AD&D). \n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class SixthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accidental Bodily Injury"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text('\n \nUnexpected injury to a person. \n\n',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class SeventhRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accidental Death & Dismemberment"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \nAn insurance contract that pays a stated benefit in the event of death and/or dismemberment caused by accident or specified kinds of accidents. \n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class EighthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accumulation Period"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \nPeriod of time insured must incur eligible medical expenses at least equal to the deductible amount in order to establish a benefit period under a major medical expense or comprehensive medical expense policy. \n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class NinethRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Actual Cash Value"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \nRepayment value for indemnification due to loss or damage of property; in most cases it is replacement cost minus depreciation. \n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class NinethAndAHalfRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Actuarial Report"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \n(PC Insurance)a document or other presentation, prepared as a formal means of conveying to the state regulatory authority and the Board of Directors, or its equivalent, the actuary\'s professional conclusions and recommendations, of recording and communicating the methods and procedures, of assuring that the parties addressed are aware of the significance of the actuary\'s opinion or findings and that documents the analysis underlying the opinion. (In Life and Health) this document would be called an "Actuarial Memorandum." \n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class TenthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Actuary"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \nBusiness professional who analyzes probabilities of risk and risk management including calculation of premiums, dividends and other applicable insurance industry standards. \n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class EleventhRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adjuster"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \nA person who investigates claims and recommends settlement options based on estimates of damage and insurance policies held. \n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class TwelfthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admission"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \nHospital inpatient care for any medical condition. \n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class ThirteenthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admitted Assets"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \nInsurer assets which can be valued and included on the balance sheet to determine financial viability of the company. \n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class FourteenthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admitted Company"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \nAn insurance company licensed to do business in a state(s), domiciled in an alternative state or country. \n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class FifteenthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Advance Premiums"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \nOccur when a policy has been processed, and the premium has been paid prior to the effective date. These are a liability to the company and not included in written premium or the unearned premium reserve. \n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class SixteenthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adverse Selection"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \nThe social phenomenon whereby persons with a higher than average probability of loss seek greater insurance coverage than those with less risk. \n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class SeventeenthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Advisory Organization"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \nA group supported by member companies whose function is to gather loss statistics and publish trended loss costs. \n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class EithteenthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Affiliate"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \nA person or entity that directly, or indirectly, through one or more other persons or entities, controls, is controlled by or is under common control with the insurer.\n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class NineteenthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agent"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \nAn individual who sells, services, or negotiates insurance policies either on behalf of a company or independently.\n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class TwentythRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aggregate"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \nThe maximum dollar amount or total amount of coverage payable for a single loss, or multiple losses, during a policy period, or on a single project. \n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class TwentyFirsthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aggregate Cost Payments"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \nMethod of reimbursement of a health plan with a corporate entity that directly provides care, where (1) the health plan is contractually required to pay the total operating costs of the corporate entity, less any income to the entity from other users of services, and (2) there are mutual unlimited guarantees of solvency between the entity and the health plan that put their respective capital and surplus at risk in guaranteeing each other. \n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class TwentySecondthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aircraft"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \nCoverage for aircraft (hull) and their contents; aircraft owners\' and aircraft manufacturers liability to passengers, airports and other third parties. \n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class TwentyThirthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ALAE"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \nAn estimate of the claims settlement associated with a particular claim or claims. \n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class TwentyFourthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alien Company"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \nAn insurance company formed according to the laws of a foreign country. The company must conform to state regulatory standards to legally sell insurance products in that state. \n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class TwentyFifthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Allied Lines"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \nCoverages which are generally written with property insurance, e.g., glass, tornado, windstorm and hail; sprinkler and water damage; explosion, riot, and civil commotion; growing crops; flood; rain; and damage from aircraft and vehicle, etc. \n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class TwentySixthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All-Risk"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Text(
            '\n \nAlso known as open peril, this type of policy covers a broad range of losses. The policy covers risks not explicitly excluded in the policy contract. \n\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[300],
            child: Text(
              "Back to Contents",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
