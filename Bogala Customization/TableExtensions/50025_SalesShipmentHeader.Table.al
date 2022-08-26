tableextension 50025 SalesShipmentHeader extends "Sales Shipment Header"
{
    fields
    {
        field(50000; "10% Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50010; "Description 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50011; "Vessel"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50012; "LC No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50013; "LC Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50014; "LC Bank"; Code[60])
        {
            DataClassification = ToBeClassified;
        }
        field(50015; "Delivery Details"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50016; "Destination"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50017; "Customer Order Number."; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50018; "Bank Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";
        }
        field(50019; "Customer Order Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50020; "Flight No"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50021; "Shipping Marks"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50022; "Packing Comm."; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50023; "Remarks"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Cancelled,Combined Shipment';
            OptionMembers = " ","Cancelled","Combined Shipment";
        }
    }
}