table 50005 "Customized Data Upgrade"
{
    DataClassification = ToBeClassified;
    //Test Comment

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","G/L Entry","G/L Account","Cust. Led. Entry",Vendor,"Vendor Led. Entry",Item,"Sales Header","Purch. Header","Sales Inv. Header","Sales Cred. Header","Purch. Inv. Header","Bank Account","Bank Led. Entry","Item Led. Entry","Value Entry","Sales Line",Customer,"Fixed Asset","Sales Ship. Header","Sales Inv. Line","Sales Cred. Line","Purch. Cred. Header","Purch. Rec. Header";
            OptionCaption = ' ,G/L Entry,G/L Account,Cust. Led. Entry,Vendor,Vendor Led. Entry,Item,Sales Header,Purch. Header,Sales Inv. Header,Sales Cred. Header,Purch. Inv. Header,Bank Account,Bank Led. Entry,Item Led. Entry,Value Entry,Sales Line,Customer,Fixed Asset,Sales Ship. Header,Sales Inv. Line,Sales Cred. Line,Purch. Cred. Header,Purch. Rec. Header';
        }
        field(2; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "GLE Description 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "GLE REM_TYPE"; Text[1])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "GLE CHG_FROM"; Text[1])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "CustLED Bank Branch Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "CustLED Description 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "CustLED REM_TYPE"; Text[1])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "CustLED CHG_FROM"; Text[1])
        {
            DataClassification = ToBeClassified;
        }

        field(10; "Vendor SVAT Registration No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Vendor SWIFT Code"; Text[10])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Vendor BENE_BANK_CODE"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Vendor Bank Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Vendor BENE_BRANCH_CODE"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Vendor Branch Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Vendor BENE_ID_NO"; Text[10])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Vendor BENE_ACCNO"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Vendor Branch Code"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Vendor Bank Account No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Vendor Bank Code"; Text[4])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "VendL Bank Branch Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "VendL Description 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "VendL REM_TYPE"; Text[1])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "VendL CHG_FROM"; Text[1])
        {
            DataClassification = ToBeClassified;
        }

        field(25; "Item Obsolete"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Obsolete,Impaired';
            OptionMembers = " ","Obsolete","Impaired";
        }
        field(26; "Item BGL Product Group Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "BGL Product Group".Code where("Item Category Code" = field("Item Category Code"));
        }
        field(27; "SalesHedd 10% Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "SalesHedd Description 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "SalesHedd Vessel"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "SalesHedd LC No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "SalesHedd LC Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "SalesHedd LC Bank"; Code[60])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "SalesHedd Delivery Details"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "SalesHedd Destination"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "SalesHedd Customer Order No."; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(36; "SalesHedd Bank Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";
        }
        field(37; "SalesHedd Customer Order Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(38; "SalesHedd Flight No"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(39; "SalesHedd Shipping Marks"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(40; "SalesHedd Packing Comm."; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(41; "SalesHedd Remarks"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Cancelled,Combined Shipment';
            OptionMembers = " ","Cancelled","Combined Shipment";
        }

        field(42; "PurchHedd Delivery Details"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(43; "PurchHedd Part Shipment"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(44; "PurchHedd Vendor Invoice Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(45; "PurchHedd Shiipping Marks"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(46; "PurchHedd Description 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(47; "PurchHedd Tax Group"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tax Detail"."Tax Group Code";
        }
        field(48; "PurchHedd Approval Entry"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Approval Entry";
        }
        field(49; "PurchHedd Created User"; Code[50])
        {
            DataClassification = ToBeClassified;
            //Editable = false;
        }
        field(50; "PurchHedd PO No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(51; "PurchHedd Remarks"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Partialy Received ,Cancelled,Partially Received PO Close';
            OptionMembers = " ","Partialy Received","Cancelled","Partially Received PO Close";
        }

        field(52; "SalesInvHed 10% Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(53; "SalesInvHed Description 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(54; "SalesInvHed Vessel"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(55; "SalesInvHed LC No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(56; "SalesInvHed LC Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(57; "SalesInvHed LC Bank"; Code[60])
        {
            DataClassification = ToBeClassified;
        }
        field(58; "SalesInvHed Delivery Details"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(59; "SalesInvHed Destination"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60; "SalesInvHed Cust. Order No."; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(61; "SalesInvHed Bank Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";
        }
        field(62; "SalesInvHed Cust Order Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(63; "SalesInvHed Flight No"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(64; "SalesInvHed Shipping Marks"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(65; "SalesInvHed Packing Comm."; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(66; "SalesInvHed Remarks"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Cancelled,Combined Shipment';
            OptionMembers = " ","Cancelled","Combined Shipment";
        }

        field(67; "SalesCredHedd 10% Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(68; "SalesCredHedd Description 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(69; "SalesCredHedd Vessel"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70; "SalesCredHedd LC No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(71; "SalesCredHedd LC Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(72; "SalesCredHedd LC Bank"; Code[60])
        {
            DataClassification = ToBeClassified;
        }
        field(73; "SalesCredHedd Delivery Details"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(74; "SalesCredHedd Destination"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(75; "SalesCredHedd Cust Order No."; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(76; "SalesCredHedd Bank Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";
        }
        field(77; "SalesCredHedd Cust Order Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(78; "SalesCredHedd Flight No"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(79; "SalesCredHedd Shipping Marks"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(80; "SalesCredHedd Packing Comm."; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(81; "SalesCredHedd Remarks"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Cancelled,Combined Shipment';
            OptionMembers = " ","Cancelled","Combined Shipment";
        }

        field(82; "PurchInvHed Delivery Details"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(83; "PurchInvHed Part Shipment"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(84; "PurchInvHed Vendor Inv Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(85; "PurchInvHed Shiipping Marks"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(86; "PurchInvHed Description 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(87; "PurchInvHed Created User"; Code[50])
        {
            DataClassification = ToBeClassified;
            //Editable = false;
        }
        field(88; "BankAcc Bank Code"; Text[4])
        {
            DataClassification = ToBeClassified;
        }
        field(89; "BankAcc Branch Code"; Text[3])
        {
            DataClassification = ToBeClassified;
        }
        field(90; "BankAcc Branch Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(91; "BankAccLed Payee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(92; "BankAccLed Special Inst 1"; Text[35])
        {
            DataClassification = ToBeClassified;
        }
        field(93; "BankAccLed Special Inst 2"; Text[35])
        {
            DataClassification = ToBeClassified;
        }
        field(94; "BankAccLed Description 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(95; "BankAccLed REM_TYPE"; Text[1])
        {
            DataClassification = ToBeClassified;
        }
        field(96; "BankAccLed CHG_FROM"; Text[1])
        {
            DataClassification = ToBeClassified;
        }
        field(97; "BankAccLed Exported"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(98; "BankAccLed Pick Up By"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,C,B';
            OptionMembers = " ","C","B";
        }
        field(99; "BankAccLed Pick Up Method"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,P,M,C';
            OptionMembers = " ","P","M","C";
        }
        field(100; "BankAccLed Payment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,SLIPS,CC,BT,RTGS,LBC,OTT,CEFTS';
            OptionMembers = " ","SLIPS","CC","BT","RTGS","LBC","OTT","CEFTS";
        }
        field(101; "BankAccLed Exported File"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(102; "ItemLed Description 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(103; "ValEntry Description 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(104; "SalesLine Shipping Marks"; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(105; "SalesLine No.of Packages"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(106; "SalesLine Packing Comm."; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(107; "SalesLine No Of Units"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(108; "SalesLine H.S.Code"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(109; "Cust SVAT Registration No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(110; "FA Physical Identification No."; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(111; "SalesShipHed 10% Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(112; "SalesShipHed Description 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(113; "SalesShipHed Vessel"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(114; "SalesShipHed LC No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(115; "SalesShipHed LC Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(116; "SalesShipHed LC Bank"; Code[60])
        {
            DataClassification = ToBeClassified;
        }
        field(117; "SalesShipHed Delivery Details"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(118; "SalesShipHed Destination"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(119; "SalesShipHed Cust Order No."; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(120; "SalesShipHed Bank Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";
        }
        field(121; "SalesShipHed Cust Order Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(122; "SalesShipHed Flight No"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(123; "SalesShipHed Shipping Marks"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(124; "SalesShipHed Packing Comm."; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(125; "SalesShipHed Remarks"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Cancelled,Combined Shipment';
            OptionMembers = " ","Cancelled","Combined Shipment";
        }

        field(126; "SalesInvLine Shipping Marks"; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(127; "SalesInvLine No.of Packages"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(128; "SalesInvLine Packing Comm."; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(129; "SalesInvLine No Of Units"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(130; "SalesInvLine H.S.Code"; Text[30])
        {
            DataClassification = ToBeClassified;
        }

        field(131; "SalesCredLine Shipping Marks"; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(132; "SalesCredLine No.of Packages"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(133; "SalesCredLine Packing Comm."; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(134; "SalesCredLine No Of Units"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(135; "SalesCredLine H.S.Code"; Text[30])
        {
            DataClassification = ToBeClassified;
        }

        field(136; "PurchCredHed Delivery Details"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(137; "PurchCredHed Part Shipment"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(138; "PurchCredHed Vendor Inv Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(139; "PurchCredHed Shiipping Marks"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(140; "PurchCredHed Description 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(141; "PurchCredHed Created User"; Code[50])
        {
            DataClassification = ToBeClassified;
            //Editable = false;
        }

        field(142; "PurchRec Delivery Details"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(143; "PurchRec Part Shipment"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(144; "PurchRec Vendor Invoice Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(145; "PurchRec Shiipping Marks"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(146; "PurchRec Description 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(147; "PurchRec Created User"; Code[50])
        {
            DataClassification = ToBeClassified;
            //Editable = false;
        }
        field(148; "Document Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(149; Updated; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Document Type", "Document No.")
        {
            Clustered = true;
        }
    }


    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}