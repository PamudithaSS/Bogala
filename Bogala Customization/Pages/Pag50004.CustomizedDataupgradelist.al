page 50004 "Customized Data upgrade list"
{
    ApplicationArea = All;
    Caption = 'Customized Data upgrade list';
    PageType = List;
    SourceTable = "Customized Data Upgrade";
    UsageCategory = Lists;
    Permissions = tabledata "G/L Entry" = rm, tabledata "Cust. Ledger Entry" = rm, tabledata "Vendor Ledger Entry" = rm
                    , tabledata "Sales Invoice Header" = rm, tabledata "Sales Cr.Memo Header" = rm, tabledata "Purch. Inv. Header" = rm,
                    tabledata "Bank Account Ledger Entry" = rm, tabledata "Item Ledger Entry" = rm, tabledata "Value Entry" = rm, tabledata "Sales Shipment Header" = rm
                    , tabledata "Sales Invoice Line" = rm, tabledata "Sales Cr.Memo Line" = rm, tabledata "Purch. Cr. Memo Hdr." = rm, tabledata "Purch. Rcpt. Header" = rm;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Document Line No."; Rec."Document Line No.")
                {
                    ApplicationArea = All;
                }
                field("BankAcc Bank Code"; Rec."BankAcc Bank Code")
                {
                    ApplicationArea = All;
                }
                field("BankAcc Branch Code"; Rec."BankAcc Branch Code")
                {
                    ApplicationArea = All;
                }
                field("BankAcc Branch Name"; Rec."BankAcc Branch Name")
                {
                    ApplicationArea = All;
                }
                field("BankAccLed CHG_FROM"; Rec."BankAccLed CHG_FROM")
                {
                    ApplicationArea = All;
                }
                field("BankAccLed Description 2"; Rec."BankAccLed Description 2")
                {
                    ApplicationArea = All;
                }
                field("BankAccLed Exported"; Rec."BankAccLed Exported")
                {
                    ApplicationArea = All;
                }
                field("BankAccLed Exported File"; Rec."BankAccLed Exported File")
                {
                    ApplicationArea = All;
                }
                field("BankAccLed Payee Name"; Rec."BankAccLed Payee Name")
                {
                    ApplicationArea = All;
                }
                field("BankAccLed Payment Type"; Rec."BankAccLed Payment Type")
                {
                    ApplicationArea = All;
                }
                field("BankAccLed Pick Up By"; Rec."BankAccLed Pick Up By")
                {
                    ApplicationArea = All;
                }
                field("BankAccLed Pick Up Method"; Rec."BankAccLed Pick Up Method")
                {
                    ApplicationArea = All;
                }
                field("BankAccLed REM_TYPE"; Rec."BankAccLed REM_TYPE")
                {
                    ApplicationArea = All;
                }
                field("BankAccLed Special Inst 1"; Rec."BankAccLed Special Inst 1")
                {
                    ApplicationArea = All;
                }
                field("BankAccLed Special Inst 2"; Rec."BankAccLed Special Inst 2")
                {
                    ApplicationArea = All;
                }
                field("Cust SVAT Registration No."; Rec."Cust SVAT Registration No.")
                {
                    ApplicationArea = All;
                }
                field("CustLED Bank Branch Code"; Rec."CustLED Bank Branch Code")
                {
                    ApplicationArea = All;
                }
                field("CustLED CHG_FROM"; Rec."CustLED CHG_FROM")
                {
                    ApplicationArea = All;
                }
                field("CustLED Description 2"; Rec."CustLED Description 2")
                {
                    ApplicationArea = All;
                }
                field("CustLED REM_TYPE"; Rec."CustLED REM_TYPE")
                {
                    ApplicationArea = All;
                }
                field("FA Physical Identification No."; Rec."FA Physical Identification No.")
                {
                    ApplicationArea = All;
                }
                field("GLE CHG_FROM"; Rec."GLE CHG_FROM")
                {
                    ApplicationArea = All;
                }
                field("GLE Description 2"; Rec."GLE Description 2")
                {
                    ApplicationArea = All;
                }
                field("GLE REM_TYPE"; Rec."GLE REM_TYPE")
                {
                    ApplicationArea = All;
                }
                field("Item BGL Product Group Code"; Rec."Item BGL Product Group Code")
                {
                    ApplicationArea = All;
                }
                field("Item Obsolete"; Rec."Item Obsolete")
                {
                    ApplicationArea = All;
                }
                field("ItemLed Description 2"; Rec."ItemLed Description 2")
                {
                    ApplicationArea = All;
                }
                field("PurchCredHed Created User"; Rec."PurchCredHed Created User")
                {
                    ApplicationArea = All;
                }
                field("PurchCredHed Delivery Details"; Rec."PurchCredHed Delivery Details")
                {
                    ApplicationArea = All;
                }
                field("PurchCredHed Description 2"; Rec."PurchCredHed Description 2")
                {
                    ApplicationArea = All;
                }
                field("PurchCredHed Part Shipment"; Rec."PurchCredHed Part Shipment")
                {
                    ApplicationArea = All;
                }
                field("PurchCredHed Shiipping Marks"; Rec."PurchCredHed Shiipping Marks")
                {
                    ApplicationArea = All;
                }
                field("PurchCredHed Vendor Inv Date"; Rec."PurchCredHed Vendor Inv Date")
                {
                    ApplicationArea = All;
                }
                field("PurchHedd Approval Entry"; Rec."PurchHedd Approval Entry")
                {
                    ApplicationArea = All;
                }
                field("PurchHedd Created User"; Rec."PurchHedd Created User")
                {
                    ApplicationArea = All;
                }
                field("PurchHedd Delivery Details"; Rec."PurchHedd Delivery Details")
                {
                    ApplicationArea = All;
                }
                field("PurchHedd Description 2"; Rec."PurchHedd Description 2")
                {
                    ApplicationArea = All;
                }
                field("PurchHedd PO No. Series"; Rec."PurchHedd PO No. Series")
                {
                    ApplicationArea = All;
                }
                field("PurchHedd Part Shipment"; Rec."PurchHedd Part Shipment")
                {
                    ApplicationArea = All;
                }
                field("PurchHedd Remarks"; Rec."PurchHedd Remarks")
                {
                    ApplicationArea = All;
                }
                field("PurchHedd Shiipping Marks"; Rec."PurchHedd Shiipping Marks")
                {
                    ApplicationArea = All;
                }
                field("PurchHedd Tax Group"; Rec."PurchHedd Tax Group")
                {
                    ApplicationArea = All;
                }
                field("PurchHedd Vendor Invoice Date"; Rec."PurchHedd Vendor Invoice Date")
                {
                    ApplicationArea = All;
                }
                field("PurchInvHed Created User"; Rec."PurchInvHed Created User")
                {
                    ApplicationArea = All;
                }
                field("PurchInvHed Delivery Details"; Rec."PurchInvHed Delivery Details")
                {
                    ApplicationArea = All;
                }
                field("PurchInvHed Description 2"; Rec."PurchInvHed Description 2")
                {
                    ApplicationArea = All;
                }
                field("PurchInvHed Part Shipment"; Rec."PurchInvHed Part Shipment")
                {
                    ApplicationArea = All;
                }
                field("PurchInvHed Shiipping Marks"; Rec."PurchInvHed Shiipping Marks")
                {
                    ApplicationArea = All;
                }
                field("PurchInvHed Vendor Inv Date"; Rec."PurchInvHed Vendor Inv Date")
                {
                    ApplicationArea = All;
                }
                field("PurchRec Created User"; Rec."PurchRec Created User")
                {
                    ApplicationArea = All;
                }
                field("PurchRec Delivery Details"; Rec."PurchRec Delivery Details")
                {
                    ApplicationArea = All;
                }
                field("PurchRec Description 2"; Rec."PurchRec Description 2")
                {
                    ApplicationArea = All;
                }
                field("PurchRec Part Shipment"; Rec."PurchRec Part Shipment")
                {
                    ApplicationArea = All;
                }
                field("PurchRec Shiipping Marks"; Rec."PurchRec Shiipping Marks")
                {
                    ApplicationArea = All;
                }
                field("PurchRec Vendor Invoice Date"; Rec."PurchRec Vendor Invoice Date")
                {
                    ApplicationArea = All;
                }
                field("SalesCredHedd 10% Date"; Rec."SalesCredHedd 10% Date")
                {
                    ApplicationArea = All;
                }
                field("SalesCredHedd Bank Code"; Rec."SalesCredHedd Bank Code")
                {
                    ApplicationArea = All;
                }
                field("SalesCredHedd Cust Order Date"; Rec."SalesCredHedd Cust Order Date")
                {
                    ApplicationArea = All;
                }
                field("SalesCredHedd Cust Order No."; Rec."SalesCredHedd Cust Order No.")
                {
                    ApplicationArea = All;
                }
                field("SalesCredHedd Delivery Details"; Rec."SalesCredHedd Delivery Details")
                {
                    ApplicationArea = All;
                }
                field("SalesCredHedd Description 2"; Rec."SalesCredHedd Description 2")
                {
                    ApplicationArea = All;
                }
                field("SalesCredHedd Destination"; Rec."SalesCredHedd Destination")
                {
                    ApplicationArea = All;
                }
                field("SalesCredHedd Flight No"; Rec."SalesCredHedd Flight No")
                {
                    ApplicationArea = All;
                }
                field("SalesCredHedd LC Bank"; Rec."SalesCredHedd LC Bank")
                {
                    ApplicationArea = All;
                }
                field("SalesCredHedd LC Date"; Rec."SalesCredHedd LC Date")
                {
                    ApplicationArea = All;
                }
                field("SalesCredHedd LC No"; Rec."SalesCredHedd LC No")
                {
                    ApplicationArea = All;
                }
                field("SalesCredHedd Packing Comm."; Rec."SalesCredHedd Packing Comm.")
                {
                    ApplicationArea = All;
                }
                field("SalesCredHedd Remarks"; Rec."SalesCredHedd Remarks")
                {
                    ApplicationArea = All;
                }
                field("SalesCredHedd Shipping Marks"; Rec."SalesCredHedd Shipping Marks")
                {
                    ApplicationArea = All;
                }
                field("SalesCredHedd Vessel"; Rec."SalesCredHedd Vessel")
                {
                    ApplicationArea = All;
                }
                field("SalesCredLine H.S.Code"; Rec."SalesCredLine H.S.Code")
                {
                    ApplicationArea = All;
                }
                field("SalesCredLine No Of Units"; Rec."SalesCredLine No Of Units")
                {
                    ApplicationArea = All;
                }
                field("SalesCredLine No.of Packages"; Rec."SalesCredLine No.of Packages")
                {
                    ApplicationArea = All;
                }
                field("SalesCredLine Packing Comm."; Rec."SalesCredLine Packing Comm.")
                {
                    ApplicationArea = All;
                }
                field("SalesCredLine Shipping Marks"; Rec."SalesCredLine Shipping Marks")
                {
                    ApplicationArea = All;
                }
                field("SalesHedd 10% Date"; Rec."SalesHedd 10% Date")
                {
                    ApplicationArea = All;
                }
                field("SalesHedd Bank Code"; Rec."SalesHedd Bank Code")
                {
                    ApplicationArea = All;
                }
                field("SalesHedd Customer Order Date"; Rec."SalesHedd Customer Order Date")
                {
                    ApplicationArea = All;
                }
                field("SalesHedd Customer Order No."; Rec."SalesHedd Customer Order No.")
                {
                    ApplicationArea = All;
                }
                field("SalesHedd Delivery Details"; Rec."SalesHedd Delivery Details")
                {
                    ApplicationArea = All;
                }
                field("SalesHedd Description 2"; Rec."SalesHedd Description 2")
                {
                    ApplicationArea = All;
                }
                field("SalesHedd Destination"; Rec."SalesHedd Destination")
                {
                    ApplicationArea = All;
                }
                field("SalesHedd Flight No"; Rec."SalesHedd Flight No")
                {
                    ApplicationArea = All;
                }
                field("SalesHedd LC Bank"; Rec."SalesHedd LC Bank")
                {
                    ApplicationArea = All;
                }
                field("SalesHedd LC Date"; Rec."SalesHedd LC Date")
                {
                    ApplicationArea = All;
                }
                field("SalesHedd LC No"; Rec."SalesHedd LC No")
                {
                    ApplicationArea = All;
                }
                field("SalesHedd Packing Comm."; Rec."SalesHedd Packing Comm.")
                {
                    ApplicationArea = All;
                }
                field("SalesHedd Remarks"; Rec."SalesHedd Remarks")
                {
                    ApplicationArea = All;
                }
                field("SalesHedd Shipping Marks"; Rec."SalesHedd Shipping Marks")
                {
                    ApplicationArea = All;
                }
                field("SalesHedd Vessel"; Rec."SalesHedd Vessel")
                {
                    ApplicationArea = All;
                }
                field("SalesInvHed 10% Date"; Rec."SalesInvHed 10% Date")
                {
                    ApplicationArea = All;
                }
                field("SalesInvHed Bank Code"; Rec."SalesInvHed Bank Code")
                {
                    ApplicationArea = All;
                }
                field("SalesInvHed Cust Order Date"; Rec."SalesInvHed Cust Order Date")
                {
                    ApplicationArea = All;
                }
                field("SalesInvHed Cust. Order No."; Rec."SalesInvHed Cust. Order No.")
                {
                    ApplicationArea = All;
                }
                field("SalesInvHed Delivery Details"; Rec."SalesInvHed Delivery Details")
                {
                    ApplicationArea = All;
                }
                field("SalesInvHed Description 2"; Rec."SalesInvHed Description 2")
                {
                    ApplicationArea = All;
                }
                field("SalesInvHed Destination"; Rec."SalesInvHed Destination")
                {
                    ApplicationArea = All;
                }
                field("SalesInvHed Flight No"; Rec."SalesInvHed Flight No")
                {
                    ApplicationArea = All;
                }
                field("SalesInvHed LC Bank"; Rec."SalesInvHed LC Bank")
                {
                    ApplicationArea = All;
                }
                field("SalesInvHed LC Date"; Rec."SalesInvHed LC Date")
                {
                    ApplicationArea = All;
                }
                field("SalesInvHed LC No"; Rec."SalesInvHed LC No")
                {
                    ApplicationArea = All;
                }
                field("SalesInvHed Packing Comm."; Rec."SalesInvHed Packing Comm.")
                {
                    ApplicationArea = All;
                }
                field("SalesInvHed Remarks"; Rec."SalesInvHed Remarks")
                {
                    ApplicationArea = All;
                }
                field("SalesInvHed Shipping Marks"; Rec."SalesInvHed Shipping Marks")
                {
                    ApplicationArea = All;
                }
                field("SalesInvHed Vessel"; Rec."SalesInvHed Vessel")
                {
                    ApplicationArea = All;
                }
                field("SalesInvLine H.S.Code"; Rec."SalesInvLine H.S.Code")
                {
                    ApplicationArea = All;
                }
                field("SalesInvLine No Of Units"; Rec."SalesInvLine No Of Units")
                {
                    ApplicationArea = All;
                }
                field("SalesInvLine No.of Packages"; Rec."SalesInvLine No.of Packages")
                {
                    ApplicationArea = All;
                }
                field("SalesInvLine Packing Comm."; Rec."SalesInvLine Packing Comm.")
                {
                    ApplicationArea = All;
                }
                field("SalesInvLine Shipping Marks"; Rec."SalesInvLine Shipping Marks")
                {
                    ApplicationArea = All;
                }
                field("SalesLine H.S.Code"; Rec."SalesLine H.S.Code")
                {
                    ApplicationArea = All;
                }
                field("SalesLine No Of Units"; Rec."SalesLine No Of Units")
                {
                    ApplicationArea = All;
                }
                field("SalesLine No.of Packages"; Rec."SalesLine No.of Packages")
                {
                    ApplicationArea = All;
                }
                field("SalesLine Packing Comm."; Rec."SalesLine Packing Comm.")
                {
                    ApplicationArea = All;
                }
                field("SalesLine Shipping Marks"; Rec."SalesLine Shipping Marks")
                {
                    ApplicationArea = All;
                }
                field("SalesShipHed 10% Date"; Rec."SalesShipHed 10% Date")
                {
                    ApplicationArea = All;
                }
                field("SalesShipHed Bank Code"; Rec."SalesShipHed Bank Code")
                {
                    ApplicationArea = All;
                }
                field("SalesShipHed Cust Order Date"; Rec."SalesShipHed Cust Order Date")
                {
                    ApplicationArea = All;
                }
                field("SalesShipHed Cust Order No."; Rec."SalesShipHed Cust Order No.")
                {
                    ApplicationArea = All;
                }
                field("SalesShipHed Delivery Details"; Rec."SalesShipHed Delivery Details")
                {
                    ApplicationArea = All;
                }
                field("SalesShipHed Description 2"; Rec."SalesShipHed Description 2")
                {
                    ApplicationArea = All;
                }
                field("SalesShipHed Destination"; Rec."SalesShipHed Destination")
                {
                    ApplicationArea = All;
                }
                field("SalesShipHed Flight No"; Rec."SalesShipHed Flight No")
                {
                    ApplicationArea = All;
                }
                field("SalesShipHed LC Bank"; Rec."SalesShipHed LC Bank")
                {
                    ApplicationArea = All;
                }
                field("SalesShipHed LC Date"; Rec."SalesShipHed LC Date")
                {
                    ApplicationArea = All;
                }
                field("SalesShipHed LC No"; Rec."SalesShipHed LC No")
                {
                    ApplicationArea = All;
                }
                field("SalesShipHed Packing Comm."; Rec."SalesShipHed Packing Comm.")
                {
                    ApplicationArea = All;
                }
                field("SalesShipHed Remarks"; Rec."SalesShipHed Remarks")
                {
                    ApplicationArea = All;
                }
                field("SalesShipHed Shipping Marks"; Rec."SalesShipHed Shipping Marks")
                {
                    ApplicationArea = All;
                }
                field("SalesShipHed Vessel"; Rec."SalesShipHed Vessel")
                {
                    ApplicationArea = All;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ApplicationArea = All;
                }
                field(SystemId; Rec.SystemId)
                {
                    ApplicationArea = All;
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ApplicationArea = All;
                }
                field("ValEntry Description 2"; Rec."ValEntry Description 2")
                {
                    ApplicationArea = All;
                }
                field("VendL Bank Branch Code"; Rec."VendL Bank Branch Code")
                {
                    ApplicationArea = All;
                }
                field("VendL CHG_FROM"; Rec."VendL CHG_FROM")
                {
                    ApplicationArea = All;
                }
                field("VendL Description 2"; Rec."VendL Description 2")
                {
                    ApplicationArea = All;
                }
                field("VendL REM_TYPE"; Rec."VendL REM_TYPE")
                {
                    ApplicationArea = All;
                }
                field("Vendor BENE_ACCNO"; Rec."Vendor BENE_ACCNO")
                {
                    ApplicationArea = All;
                }
                field("Vendor BENE_BANK_CODE"; Rec."Vendor BENE_BANK_CODE")
                {
                    ApplicationArea = All;
                }
                field("Vendor BENE_BRANCH_CODE"; Rec."Vendor BENE_BRANCH_CODE")
                {
                    ApplicationArea = All;
                }
                field("Vendor BENE_ID_NO"; Rec."Vendor BENE_ID_NO")
                {
                    ApplicationArea = All;
                }
                field("Vendor Bank Account No."; Rec."Vendor Bank Account No.")
                {
                    ApplicationArea = All;
                }
                field("Vendor Bank Code"; Rec."Vendor Bank Code")
                {
                    ApplicationArea = All;
                }
                field("Vendor Bank Name"; Rec."Vendor Bank Name")
                {
                    ApplicationArea = All;
                }
                field("Vendor Branch Code"; Rec."Vendor Branch Code")
                {
                    ApplicationArea = All;
                }
                field("Vendor Branch Name"; Rec."Vendor Branch Name")
                {
                    ApplicationArea = All;
                }
                field("Vendor SVAT Registration No."; Rec."Vendor SVAT Registration No.")
                {
                    ApplicationArea = All;
                }
                field("Vendor SWIFT Code"; Rec."Vendor SWIFT Code")
                {
                    ApplicationArea = All;
                }
                field(Updated; rec.Updated)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Creation)
        {
            action("Update Customization - GL Entry")
            {
                ApplicationArea = All;
                Image = GeneralLedger;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    CustDataUpgrade: Record "Customized Data Upgrade";
                    GLEntry: Record "G/L Entry";
                    Window: Dialog;
                begin
                    Window.Open('Updating###1###/####2####');
                    GLEntry.LockTable();

                    Window.Update(1, 'GL Entry');

                    CustDataUpgrade.Reset();
                    CustDataUpgrade.SetCurrentKey("Document Type", "Document No.");
                    CustDataUpgrade.SetRange("Document Type", CustDataUpgrade."Document Type"::"G/L Entry");
                    CustDataUpgrade.SetRange(Updated, false);
                    if CustDataUpgrade.FindFirst() then begin
                        repeat
                            Window.Update(2, CustDataUpgrade."Document No.");
                            GLEntry.Get(CustDataUpgrade."Document No.");
                            GLEntry."Description 2" := CustDataUpgrade."GLE Description 2";
                            GLEntry.Modify();
                            CustDataUpgrade.Updated := true;
                            CustDataUpgrade.Modify();
                        until CustDataUpgrade.Next() = 0;
                    end;
                    Window.Close();
                    Message('G/L Updated');
                end;
            }
            action("Update Customization - Cust Led Entry")
            {
                ApplicationArea = All;
                Image = CustomerLedger;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    CustDataUpgrade: Record "Customized Data Upgrade";
                    CustLedEntry: Record "Cust. Ledger Entry";
                    Window: Dialog;
                begin
                    Window.Open('Updating###1###/####2####');
                    CustLedEntry.LockTable();

                    Window.Update(1, 'Cust. Led. Entry');

                    CustDataUpgrade.Reset();
                    CustDataUpgrade.SetCurrentKey("Document Type", "Document No.");
                    CustDataUpgrade.SetRange("Document Type", CustDataUpgrade."Document Type"::"Cust. Led. Entry");
                    CustDataUpgrade.SetRange(Updated, false);
                    if CustDataUpgrade.FindFirst() then begin
                        repeat
                            Window.Update(2, CustDataUpgrade."Document No.");
                            CustLedEntry.Get(CustDataUpgrade."Document No.");
                            CustLedEntry."Description 2" := CustDataUpgrade."CustLED Description 2";
                            CustLedEntry.Modify();
                            CustDataUpgrade.Updated := true;
                            CustDataUpgrade.Modify();
                        until CustDataUpgrade.Next() = 0;
                    end;
                    Window.Close();
                    Message('Cust. Ledger Updated');
                end;
            }
            action("Update Customization - Vendor Led Entry")
            {
                ApplicationArea = All;
                Image = VendorLedger;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    CustDataUpgrade: Record "Customized Data Upgrade";
                    VendorLedEntry: Record "Vendor Ledger Entry";
                    Window: Dialog;
                begin
                    Window.Open('Updating###1###/####2####');
                    VendorLedEntry.LockTable();

                    Window.Update(1, 'Vendor Led. Entry');

                    CustDataUpgrade.Reset();
                    CustDataUpgrade.SetCurrentKey("Document Type", "Document No.");
                    CustDataUpgrade.SetRange("Document Type", CustDataUpgrade."Document Type"::"Vendor Led. Entry");
                    CustDataUpgrade.SetRange(Updated, false);
                    if CustDataUpgrade.FindFirst() then begin
                        repeat
                            Window.Update(2, CustDataUpgrade."Document No.");
                            VendorLedEntry.Get(CustDataUpgrade."Document No.");
                            VendorLedEntry."Description 2" := CustDataUpgrade."VendL Description 2";
                            VendorLedEntry.Modify();
                            CustDataUpgrade.Updated := true;
                            CustDataUpgrade.Modify();
                        until CustDataUpgrade.Next() = 0;
                    end;
                    Window.Close();
                    Message('Vendor Ledger Updated');
                end;
            }

            action("Update Customization - Sales Inv. Header")
            {
                ApplicationArea = All;
                Image = SalesInvoice;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    CustDataUpgrade: Record "Customized Data Upgrade";
                    SalesInvHedd: Record "Sales Invoice Header";
                    Window: Dialog;
                begin
                    Window.Open('Updating###1###/####2####');
                    SalesInvHedd.LockTable();

                    Window.Update(1, 'Sales Invoice');

                    CustDataUpgrade.Reset();
                    CustDataUpgrade.SetCurrentKey("Document Type", "Document No.");
                    CustDataUpgrade.SetRange("Document Type", CustDataUpgrade."Document Type"::"Sales Inv. Header");
                    CustDataUpgrade.SetRange(Updated, false);
                    if CustDataUpgrade.FindFirst() then begin
                        repeat
                            Window.Update(2, CustDataUpgrade."Document No.");
                            SalesInvHedd.Get(CustDataUpgrade."Document No.");
                            SalesInvHedd."10% Date" := CustDataUpgrade."SalesInvHed 10% Date";
                            SalesInvHedd."Description 2" := CustDataUpgrade."SalesInvHed Description 2";
                            SalesInvHedd.Vessel := CustDataUpgrade."SalesInvHed Vessel";
                            SalesInvHedd."LC No" := CustDataUpgrade."SalesInvHed LC No";
                            SalesInvHedd."LC Date" := CustDataUpgrade."SalesInvHed LC Date";
                            SalesInvHedd."LC Bank" := CustDataUpgrade."SalesInvHed LC Bank";
                            SalesInvHedd."Delivery Details" := CustDataUpgrade."SalesInvHed Delivery Details";
                            SalesInvHedd.Destination := CustDataUpgrade."SalesInvHed Destination";
                            SalesInvHedd."Customer Order Number." := CustDataUpgrade."SalesInvHed Cust. Order No.";
                            SalesInvHedd."Bank Code" := CustDataUpgrade."SalesInvHed Bank Code";
                            SalesInvHedd."Customer Order Date" := CustDataUpgrade."SalesInvHed Cust Order Date";
                            SalesInvHedd."Flight No" := CustDataUpgrade."SalesInvHed Flight No";
                            SalesInvHedd."Shipping Marks" := CustDataUpgrade."SalesInvHed Shipping Marks";
                            SalesInvHedd."Packing Comm." := CustDataUpgrade."SalesInvHed Packing Comm.";
                            SalesInvHedd.Remarks := CustDataUpgrade."SalesInvHed Remarks";
                            SalesInvHedd.Modify();
                            CustDataUpgrade.Updated := true;
                            CustDataUpgrade.Modify();
                        until CustDataUpgrade.Next() = 0;
                    end;
                    Window.Close();
                    Message('Sales Invoices Updated');
                end;
            }

            action("Update Customization - Sales Cred Header")
            {
                ApplicationArea = All;
                Image = SalesCreditMemo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    CustDataUpgrade: Record "Customized Data Upgrade";
                    SalesCredHedd: Record "Sales Cr.Memo Header";
                    Window: Dialog;
                begin
                    Window.Open('Updating###1###/####2####');
                    SalesCredHedd.LockTable();

                    Window.Update(1, 'Sales Credit note');

                    CustDataUpgrade.Reset();
                    CustDataUpgrade.SetCurrentKey("Document Type", "Document No.");
                    CustDataUpgrade.SetRange("Document Type", CustDataUpgrade."Document Type"::"Sales Cred. Header");
                    CustDataUpgrade.SetRange(Updated, false);
                    if CustDataUpgrade.FindFirst() then begin
                        repeat
                            Window.Update(2, CustDataUpgrade."Document No.");
                            SalesCredHedd.Get(CustDataUpgrade."Document No.");
                            SalesCredHedd."10% Date" := CustDataUpgrade."SalesCredHedd 10% Date";
                            SalesCredHedd."Description 2" := CustDataUpgrade."SalesCredHedd Description 2";
                            SalesCredHedd.Vessel := CustDataUpgrade."SalesCredHedd Vessel";
                            SalesCredHedd."LC No" := CustDataUpgrade."SalesCredHedd LC No";
                            SalesCredHedd."LC Date" := CustDataUpgrade."SalesCredHedd LC Date";
                            SalesCredHedd."LC Bank" := CustDataUpgrade."SalesCredHedd LC Bank";
                            SalesCredHedd."Delivery Details" := CustDataUpgrade."SalesCredHedd Delivery Details";
                            SalesCredHedd.Destination := CustDataUpgrade."SalesCredHedd Destination";
                            SalesCredHedd."Customer Order Number." := CustDataUpgrade."SalesCredHedd Cust Order No.";
                            SalesCredHedd."Bank Code" := CustDataUpgrade."SalesCredHedd Bank Code";
                            SalesCredHedd."Customer Order Date" := CustDataUpgrade."SalesCredHedd Cust Order Date";
                            SalesCredHedd."Flight No" := CustDataUpgrade."SalesCredHedd Flight No";
                            SalesCredHedd."Shipping Marks" := CustDataUpgrade."SalesCredHedd Shipping Marks";
                            SalesCredHedd."Packing Comm." := CustDataUpgrade."SalesCredHedd Packing Comm.";
                            SalesCredHedd.Remarks := CustDataUpgrade."SalesCredHedd Remarks";
                            SalesCredHedd.Modify();
                            CustDataUpgrade.Updated := true;
                            CustDataUpgrade.Modify();
                        until CustDataUpgrade.Next() = 0;
                    end;
                    Window.Close();
                    Message('Sales Cred Header Updated');
                end;
            }

            action("Update Customization - Purch Inv. Hedd")
            {
                ApplicationArea = All;
                Image = PurchaseInvoice;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    CustDataUpgrade: Record "Customized Data Upgrade";
                    PurchInvHedd: Record "Purch. Inv. Header";
                    Window: Dialog;
                begin
                    Window.Open('Updating###1###/####2####');
                    PurchInvHedd.LockTable();

                    Window.Update(1, 'Purch. Inv Hedd');

                    CustDataUpgrade.Reset();
                    CustDataUpgrade.SetCurrentKey("Document Type", "Document No.");
                    CustDataUpgrade.SetRange("Document Type", CustDataUpgrade."Document Type"::"Purch. Inv. Header");
                    CustDataUpgrade.SetRange(Updated, false);
                    if CustDataUpgrade.FindFirst() then begin
                        repeat
                            Window.Update(2, CustDataUpgrade."Document No.");
                            PurchInvHedd.Get(CustDataUpgrade."Document No.");
                            PurchInvHedd."Delivery Details" := CustDataUpgrade."PurchInvHed Delivery Details";
                            PurchInvHedd."Part Shipment" := CustDataUpgrade."PurchInvHed Part Shipment";
                            PurchInvHedd."Vendor Invoice Date" := CustDataUpgrade."PurchInvHed Vendor Inv Date";
                            PurchInvHedd."Shiipping Marks" := CustDataUpgrade."PurchInvHed Shiipping Marks";
                            PurchInvHedd."Description 2" := CustDataUpgrade."PurchInvHed Description 2";
                            PurchInvHedd."Created User" := CustDataUpgrade."PurchInvHed Created User";
                            PurchInvHedd.Modify();
                            CustDataUpgrade.Updated := true;
                            CustDataUpgrade.Modify();
                        until CustDataUpgrade.Next() = 0;
                    end;
                    Window.Close();
                    Message('Purch Inv Header Updated');
                end;
            }
            action("Update Customization - Bank Led Entry")
            {
                ApplicationArea = All;
                Image = BankAccountLedger;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    CustDataUpgrade: Record "Customized Data Upgrade";
                    BankAccLedEntry: Record "Bank Account Ledger Entry";
                    Window: Dialog;
                begin
                    Window.Open('Updating###1###/####2####');
                    BankAccLedEntry.LockTable();

                    Window.Update(1, 'Bank Acc Ledger');

                    CustDataUpgrade.Reset();
                    CustDataUpgrade.SetCurrentKey("Document Type", "Document No.");
                    CustDataUpgrade.SetRange("Document Type", CustDataUpgrade."Document Type"::"Bank Led. Entry");
                    CustDataUpgrade.SetRange(Updated, false);
                    if CustDataUpgrade.FindFirst() then begin
                        repeat
                            Window.Update(2, CustDataUpgrade."Document No.");
                            BankAccLedEntry.Get(CustDataUpgrade."Document No.");
                            BankAccLedEntry."Payee Name" := CustDataUpgrade."BankAccLed Payee Name";
                            BankAccLedEntry."Special Instruction 1" := CustDataUpgrade."BankAccLed Special Inst 1";
                            BankAccLedEntry."Special Instruction 2" := CustDataUpgrade."BankAccLed Special Inst 2";
                            BankAccLedEntry."Description 2" := CustDataUpgrade."BankAccLed Description 2";
                            BankAccLedEntry.REM_TYPE := CustDataUpgrade."BankAccLed REM_TYPE";
                            BankAccLedEntry.CHG_FROM := CustDataUpgrade."BankAccLed CHG_FROM";
                            BankAccLedEntry.Exported := CustDataUpgrade."BankAccLed Exported";
                            BankAccLedEntry."Pick Up By" := CustDataUpgrade."BankAccLed Pick Up By";
                            BankAccLedEntry."Pick Up Method" := CustDataUpgrade."BankAccLed Pick Up Method";
                            BankAccLedEntry."Payment Type" := CustDataUpgrade."BankAccLed Payment Type";
                            BankAccLedEntry."Exported File" := CustDataUpgrade."BankAccLed Exported File";
                            BankAccLedEntry.Modify();
                            CustDataUpgrade.Updated := true;
                            CustDataUpgrade.Modify();
                        until CustDataUpgrade.Next() = 0;
                    end;
                    Window.Close();
                    Message('Purch Inv Header Updated');
                end;
            }
            action("Update Customization - Item Ledger")
            {
                ApplicationArea = All;
                Image = ItemLedger;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    CustDataUpgrade: Record "Customized Data Upgrade";
                    ItemLedEntry: Record "Item Ledger Entry";
                    Window: Dialog;
                begin
                    Window.Open('Updating###1###/####2####');
                    ItemLedEntry.LockTable();

                    Window.Update(1, 'Item Led. Entry');

                    CustDataUpgrade.Reset();
                    CustDataUpgrade.SetCurrentKey("Document Type", "Document No.");
                    CustDataUpgrade.SetRange("Document Type", CustDataUpgrade."Document Type"::"Item Led. Entry");
                    CustDataUpgrade.SetRange(Updated, false);
                    if CustDataUpgrade.FindFirst() then begin
                        repeat
                            Window.Update(2, CustDataUpgrade."Document No.");
                            ItemLedEntry.Get(CustDataUpgrade."Document No.");
                            ItemLedEntry."Description 2" := CustDataUpgrade."ItemLed Description 2";
                            ItemLedEntry.Modify();
                            CustDataUpgrade.Updated := true;
                            CustDataUpgrade.Modify();
                        until CustDataUpgrade.Next() = 0;
                    end;
                    Window.Close();
                    Message('Item Ledger Updated');
                end;
            }
            action("Update Customization - Value Entry")
            {
                ApplicationArea = All;
                Image = ValueLedger;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    CustDataUpgrade: Record "Customized Data Upgrade";
                    ValueEntry: Record "Value Entry";
                    Window: Dialog;
                begin
                    Window.Open('Updating###1###/####2####');
                    ValueEntry.LockTable();

                    Window.Update(1, 'Value Entry');

                    CustDataUpgrade.Reset();
                    CustDataUpgrade.SetCurrentKey("Document Type", "Document No.");
                    CustDataUpgrade.SetRange("Document Type", CustDataUpgrade."Document Type"::"Value Entry");
                    CustDataUpgrade.SetRange(Updated, false);
                    if CustDataUpgrade.FindFirst() then begin
                        repeat
                            Window.Update(2, CustDataUpgrade."Document No.");
                            ValueEntry.Get(CustDataUpgrade."Document No.");
                            ValueEntry."Description 2" := CustDataUpgrade."ValEntry Description 2";
                            ValueEntry.Modify();
                            CustDataUpgrade.Updated := true;
                            CustDataUpgrade.Modify();
                        until CustDataUpgrade.Next() = 0;
                    end;
                    Window.Close();
                    Message('Value Entry Updated');
                end;
            }
            action("Update Customization - Shipment Hedd")
            {
                ApplicationArea = All;
                Image = SalesShipment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    CustDataUpgrade: Record "Customized Data Upgrade";
                    ShipHedd: Record "Sales Shipment Header";
                    Window: Dialog;
                begin
                    Window.Open('Updating###1###/####2####');
                    ShipHedd.LockTable();

                    Window.Update(1, 'Sales Shipment');

                    CustDataUpgrade.Reset();
                    CustDataUpgrade.SetCurrentKey("Document Type", "Document No.");
                    CustDataUpgrade.SetRange("Document Type", CustDataUpgrade."Document Type"::"Sales Ship. Header");
                    CustDataUpgrade.SetRange(Updated, false);
                    if CustDataUpgrade.FindFirst() then begin
                        repeat
                            Window.Update(2, CustDataUpgrade."Document No.");
                            ShipHedd.Get(CustDataUpgrade."Document No.");

                            ShipHedd."10% Date" := CustDataUpgrade."SalesShipHed 10% Date";
                            ShipHedd."Description 2" := CustDataUpgrade."SalesShipHed Description 2";
                            ShipHedd.Vessel := CustDataUpgrade."SalesShipHed Vessel";
                            ShipHedd."LC No" := CustDataUpgrade."SalesShipHed LC No";
                            ShipHedd."LC Date" := CustDataUpgrade."SalesShipHed LC Date";
                            ShipHedd."LC Bank" := CustDataUpgrade."SalesShipHed LC Bank";
                            ShipHedd."Delivery Details" := CustDataUpgrade."SalesShipHed Delivery Details";
                            ShipHedd.Destination := CustDataUpgrade."SalesShipHed Destination";
                            ShipHedd."Customer Order Number." := CustDataUpgrade."SalesShipHed Cust Order No.";
                            ShipHedd."Bank Code" := CustDataUpgrade."SalesShipHed Bank Code";
                            ShipHedd."Customer Order Date" := CustDataUpgrade."SalesShipHed Cust Order Date";
                            ShipHedd."Flight No" := CustDataUpgrade."SalesShipHed Flight No";
                            ShipHedd."Shipping Marks" := CustDataUpgrade."SalesShipHed Shipping Marks";
                            ShipHedd."Packing Comm." := CustDataUpgrade."SalesShipHed Packing Comm.";
                            ShipHedd.Remarks := CustDataUpgrade."SalesShipHed Remarks";
                            ShipHedd.Modify();
                            CustDataUpgrade.Updated := true;
                            CustDataUpgrade.Modify();
                        until CustDataUpgrade.Next() = 0;
                    end;
                    Window.Close();
                    Message('Sales Shipment Updated');
                end;
            }
            action("Update Customization - Sales Inv. Line")
            {
                ApplicationArea = All;
                Image = SalesInvoice;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    CustDataUpgrade: Record "Customized Data Upgrade";
                    SalesInvLine: Record "Sales Invoice Line";
                    Window: Dialog;
                begin
                    Window.Open('Updating###1###/####2####');
                    SalesInvLine.LockTable();

                    Window.Update(1, 'Sales Inv Lines');

                    CustDataUpgrade.Reset();
                    CustDataUpgrade.SetCurrentKey("Document Type", "Document No.");
                    CustDataUpgrade.SetRange("Document Type", CustDataUpgrade."Document Type"::"Sales Inv. Line");
                    CustDataUpgrade.SetRange(Updated, false);
                    if CustDataUpgrade.FindFirst() then begin
                        repeat
                            Window.Update(2, CustDataUpgrade."Document No.");
                            SalesInvLine.Get(CustDataUpgrade."Document No.", CustDataUpgrade."Document Line No.");
                            SalesInvLine."Shipping Marks" := CustDataUpgrade."SalesInvLine Shipping Marks";
                            SalesInvLine."No.of Packages" := CustDataUpgrade."SalesInvLine No.of Packages";
                            SalesInvLine."Packing Comm." := CustDataUpgrade."SalesInvLine Packing Comm.";
                            SalesInvLine."No Of Units" := CustDataUpgrade."SalesInvLine No Of Units";
                            SalesInvLine."H.S.Code" := CustDataUpgrade."SalesInvLine H.S.Code";
                            SalesInvLine.Modify();
                            CustDataUpgrade.Updated := true;
                            CustDataUpgrade.Modify();
                        until CustDataUpgrade.Next() = 0;
                    end;
                    Window.Close();
                    Message('Sales Inv Line Updated');
                end;
            }
            action("Update Customization - Sales Cred. Line")
            {
                ApplicationArea = All;
                Image = SalesCreditMemo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    CustDataUpgrade: Record "Customized Data Upgrade";
                    SalesCredLine: Record "Sales Cr.Memo Line";
                    Window: Dialog;
                begin
                    Window.Open('Updating###1###/####2####');
                    SalesCredLine.LockTable();

                    Window.Update(1, 'Sales Cred Lines');

                    CustDataUpgrade.Reset();
                    CustDataUpgrade.SetCurrentKey("Document Type", "Document No.");
                    CustDataUpgrade.SetRange("Document Type", CustDataUpgrade."Document Type"::"Sales Cred. Line");
                    CustDataUpgrade.SetRange(Updated, false);
                    if CustDataUpgrade.FindFirst() then begin
                        repeat
                            Window.Update(2, CustDataUpgrade."Document No.");
                            SalesCredLine.Get(CustDataUpgrade."Document No.", CustDataUpgrade."Document Line No.");
                            SalesCredLine."Shipping Marks" := CustDataUpgrade."SalesCredLine Shipping Marks";
                            SalesCredLine."No.of Packages" := CustDataUpgrade."SalesCredLine No.of Packages";
                            SalesCredLine."Packing Comm." := CustDataUpgrade."SalesCredLine Packing Comm.";
                            SalesCredLine."No Of Units" := CustDataUpgrade."SalesCredLine No Of Units";
                            SalesCredLine."H.S.Code" := CustDataUpgrade."SalesCredLine H.S.Code";
                            SalesCredLine.Modify();
                            CustDataUpgrade.Updated := true;
                            CustDataUpgrade.Modify();
                        until CustDataUpgrade.Next() = 0;
                    end;
                    Window.Close();
                    Message('Sales Cred Line Updated');
                end;
            }
            action("Update Customization - Purch Cred. Hedd")
            {
                ApplicationArea = All;
                Image = PurchaseCreditMemo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    CustDataUpgrade: Record "Customized Data Upgrade";
                    PurchCredHedd: Record "Purch. Cr. Memo Hdr.";
                    Window: Dialog;
                begin
                    Window.Open('Updating###1###/####2####');
                    PurchCredHedd.LockTable();

                    Window.Update(1, 'Purch. Cred Hedd');

                    CustDataUpgrade.Reset();
                    CustDataUpgrade.SetCurrentKey("Document Type", "Document No.");
                    CustDataUpgrade.SetRange("Document Type", CustDataUpgrade."Document Type"::"Purch. Cred. Header");
                    CustDataUpgrade.SetRange(Updated, false);
                    if CustDataUpgrade.FindFirst() then begin
                        repeat
                            Window.Update(2, CustDataUpgrade."Document No.");
                            PurchCredHedd.Get(CustDataUpgrade."Document No.");
                            PurchCredHedd."Delivery Details" := CustDataUpgrade."PurchCredHed Delivery Details";
                            PurchCredHedd."Part Shipment" := CustDataUpgrade."PurchCredHed Part Shipment";
                            PurchCredHedd."Vendor Invoice Date" := CustDataUpgrade."PurchCredHed Vendor Inv Date";
                            PurchCredHedd."Shiipping Marks" := CustDataUpgrade."PurchCredHed Shiipping Marks";
                            PurchCredHedd."Description 2" := CustDataUpgrade."PurchCredHed Description 2";
                            PurchCredHedd."Created User" := CustDataUpgrade."PurchCredHed Created User";
                            PurchCredHedd.Modify();
                            CustDataUpgrade.Updated := true;
                            CustDataUpgrade.Modify();
                        until CustDataUpgrade.Next() = 0;
                    end;
                    Window.Close();
                    Message('Purch Cred Header Updated');
                end;
            }
            action("Update Customization - Purch Rec. Hedd")
            {
                ApplicationArea = All;
                Image = Receipt;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    CustDataUpgrade: Record "Customized Data Upgrade";
                    PurchRecHedd: Record "Purch. Rcpt. Header";
                    Window: Dialog;
                begin
                    Window.Open('Updating###1###/####2####');
                    PurchRecHedd.LockTable();

                    Window.Update(1, 'Purch. Rec Hedd');

                    CustDataUpgrade.Reset();
                    CustDataUpgrade.SetCurrentKey("Document Type", "Document No.");
                    CustDataUpgrade.SetRange("Document Type", CustDataUpgrade."Document Type"::"Purch. Rec. Header");
                    CustDataUpgrade.SetRange(Updated, false);
                    if CustDataUpgrade.FindFirst() then begin
                        repeat
                            Window.Update(2, CustDataUpgrade."Document No.");
                            PurchRecHedd.Get(CustDataUpgrade."Document No.");
                            PurchRecHedd."Delivery Details" := CustDataUpgrade."PurchRec Delivery Details";
                            PurchRecHedd."Part Shipment" := CustDataUpgrade."PurchRec Part Shipment";
                            PurchRecHedd."Vendor Invoice Date" := CustDataUpgrade."PurchRec Vendor Invoice Date";
                            PurchRecHedd."Shiipping Marks" := CustDataUpgrade."PurchRec Shiipping Marks";
                            PurchRecHedd."Description 2" := CustDataUpgrade."PurchRec Description 2";
                            PurchRecHedd."Created User" := CustDataUpgrade."PurchRec Created User";
                            PurchRecHedd.Modify();
                            CustDataUpgrade.Updated := true;
                            CustDataUpgrade.Modify();
                        until CustDataUpgrade.Next() = 0;
                    end;
                    Window.Close();
                    Message('Purch Rec Header Updated');
                end;
            }
        }
    }
}

