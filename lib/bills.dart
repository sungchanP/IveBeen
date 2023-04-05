import 'package:flutter/material.dart';

enum WidgetMaker {bills, flags}

class Bills extends StatefulWidget {
  const Bills ({super.key});

  @override
  State<Bills> createState() => _BillsState();
}

class _BillsState extends State<Bills> {


  final List<String> _flagFileList = ['AD.jpeg', 'AE.jpeg', 'AF.jpeg', 'AG.jpeg', 'AL.jpeg', 'AM.jpeg', 'AO.jpeg', 'AR.jpeg', 'AT.jpeg', 'AU.jpeg', 'AW.jpeg', 
  'AZ.jpeg', 'BA.jpeg', 'BB.jpeg', 'BD.jpeg', 'BE.jpeg', 'BF.jpeg', 'BG.jpeg', 'BH.jpeg', 'BI.jpeg', 'BJ.jpeg', 'BN.jpeg', 'BO.jpeg', 'BQ.jpeg', 
  'BR.jpeg', 'BS.jpeg', 'BT.jpeg', 'BW.jpeg', 'BY.jpeg', 'BZ.jpeg', 'CA.jpeg', 'CD.jpeg', 'CF.jpeg', 'CG.jpeg', 'CH.jpeg', 'CI.jpeg', 'CL.jpeg', 
  'CM.jpeg', 'CN.jpeg', 'CO.jpeg', 'CR.jpeg', 'CU.jpeg', 'CV.jpeg', 'CW.jpeg', 'CY.jpeg', 'CZ.jpeg', 'DE.jpeg', 'DJ.jpeg', 'DK.jpeg', 'DM.jpeg', 
  'DO.jpeg', 'DZ.jpeg', 'EC.jpeg', 'EE.jpeg', 'EG.jpeg', 'ER.jpeg', 'ES.jpeg', 'ET.jpeg', 'FI.jpeg', 'FJ.jpeg', 'FM.jpeg', 'FR.jpeg', 'GA.jpeg', 
  'GB.jpeg', 'GD.jpeg', 'GE.jpeg', 'GH.jpeg', 'GL.jpeg', 'GM.jpeg', 'GN.jpeg', 'GQ.jpeg', 'GR.jpeg', 'GT.jpeg', 'GU.jpeg', 'GW.jpeg', 'GY.jpeg', 
  'HK.jpeg', 'HN.jpeg', 'HR.jpeg', 'HT.jpeg', 'HU.jpeg', 'ID.jpeg', 'IE.jpeg', 'IL.jpeg', 'IN.jpeg', 'IQ.jpeg', 'IR.jpeg', 'IS.jpeg', 'IT.jpeg', 
  'JM.jpeg', 'JO.jpeg', 'JP.jpeg', 'KE.jpeg', 'KG.jpeg', 'KH.jpeg', 'KI.jpeg', 'KM.jpeg', 'KN.jpeg', 'KP.jpeg', 'KR.jpeg', 'KW.jpeg', 'KZ.jpeg', 
  'LA.jpeg', 'LB.jpeg', 'LC.jpeg', 'LI.jpeg', 'LK.jpeg', 'LR.jpeg', 'LS.jpeg', 'LT.jpeg', 'LU.jpeg', 'LV.jpeg', 'LY.jpeg', 'MA.jpeg', 'MC.jpeg', 
  'MD.jpeg', 'ME.jpeg', 'MG.jpeg', 'MH.jpeg', 'MK.jpeg', 'ML.jpeg', 'MM.jpeg', 'MN.jpeg', 'MO.jpeg', 'MR.jpeg', 'MT.jpeg', 'MU.jpeg', 'MV.jpeg', 
  'MW.jpeg', 'MX.jpeg', 'MY.jpeg', 'MZ.jpeg', 'NA.jpeg', 'NC.jpeg', 'NE.jpeg', 'NG.jpeg', 'NI.jpeg', 'NL.jpeg', 'NO.jpeg', 'NP.jpeg', 'NR.jpeg', 
  'NU.jpeg', 'NZ.jpeg', 'OM.jpeg', 'PA.jpeg', 'PE.jpeg', 'PG.jpeg', 'PH.jpeg', 'PK.jpeg', 'PL.jpeg', 'PR.jpeg', 'PS.jpeg', 'PT.jpeg', 'PW.jpeg', 
  'PY.jpeg', 'QA.jpeg', 'RO.jpeg', 'RS.jpeg', 'RU.jpeg', 'RW.jpeg', 'SA.jpeg', 'SB.jpeg', 'SC.jpeg', 'SD.jpeg', 'SE.jpeg', 'SG.jpeg', 'SI.jpeg', 
  'SK.jpeg', 'SL.jpeg', 'SM.jpeg', 'SN.jpeg', 'SO.jpeg', 'SR.jpeg', 'SS.jpeg', 'ST.jpeg', 'SV.jpeg', 'SX.jpeg', 'SY.jpeg', 'SZ.jpeg', 'TD.jpeg', 
  'TG.jpeg', 'TH.jpeg', 'TJ.jpeg', 'TM.jpeg', 'TN.jpeg', 'TO.jpeg', 'TR.jpeg', 'TT.jpeg', 'TV.jpeg', 'TW.jpeg', 'TZ.jpeg', 'UA.jpeg', 'UG.jpeg', 
  'US.jpeg', 'UY.jpeg', 'UZ.jpeg', 'VA.jpeg', 'VC.jpeg', 'VE.jpeg', 'VN.jpeg', 'VU.jpeg', 'WS.jpeg', 'YE.jpeg', 'ZA.jpeg', 'ZM.jpeg', 'ZW.jpeg'];


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height- MediaQuery.of(context).padding.top;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: screenHeight*0.01,
                crossAxisSpacing: screenWidth*0.02,
                childAspectRatio: 2/3,
                padding: EdgeInsets.only(left: screenWidth*0.015, right: screenWidth*0.015),
                children: [
                  for(var item in _flagFileList) Image.asset('flags_collected/$item', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/AD.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/AE.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/AF.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/AG.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/AL.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/AM.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/AO.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/AR.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/AT.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/AU.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/AW.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/AZ.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/BA.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/BB.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/BD.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/BE.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/BF.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/BG.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/BH.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/BI.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/BJ.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/BN.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/BO.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/BR.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/BS.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/BT.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/BW.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/BY.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/BZ.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/CA.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/CD.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/CF.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/CG.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/CH.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/CI.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/CL.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/CM.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/CN.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/CO.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/CR.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/CU.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/CV.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/CY.jpeg', fit: BoxFit.cover,),
                  // Image.asset('flags_collected/CZ.jpeg', fit: BoxFit.cover,),
                  
                  
                  
                  
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}