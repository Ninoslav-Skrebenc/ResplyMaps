<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RepslyMaps._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main" style="margin-top:20px;">
        <div class="col-md-12">
            <gmaps:GMap ID="GMap1" CssClass="GMap1" runat="server" Width="100%" Height="800px"></gmaps:GMap>
        </div>
         <div class="col-md-12" style="margin-top:20px;">            
             <asp:Button ID="ButtonSearch" runat="server" Text="Search" OnClick="ButtonSearch_Click" />
             <asp:TextBox ID="TextBoxRadius" runat="server" CausesValidation="True" MaxLength="5" ToolTip="Enter radius" ValidateRequestMode="Enabled">Radius...</asp:TextBox> 
             <asp:DropDownList ID="DDPlaces" runat="server">
                 <asp:ListItem>accounting</asp:ListItem>
                 <asp:ListItem>airport</asp:ListItem>
                 <asp:ListItem>amusement_park</asp:ListItem>
                 <asp:ListItem>aquarium</asp:ListItem>
                 <asp:ListItem>art_gallery</asp:ListItem>
                 <asp:ListItem>atm</asp:ListItem>
                 <asp:ListItem>bakery</asp:ListItem>
                 <asp:ListItem>bank</asp:ListItem>
                 <asp:ListItem>bar</asp:ListItem>
                 <asp:ListItem>beauty_salon</asp:ListItem>
                 <asp:ListItem>bicycle_store</asp:ListItem>
                 <asp:ListItem>book_store</asp:ListItem>
                 <asp:ListItem>bowling_alley</asp:ListItem>
                 <asp:ListItem>bus_station</asp:ListItem>
                 <asp:ListItem>cafe</asp:ListItem>
                 <asp:ListItem>campground</asp:ListItem>
                 <asp:ListItem>car_dealer</asp:ListItem>
                 <asp:ListItem>car_rental</asp:ListItem>
                 <asp:ListItem>car_repair</asp:ListItem>
                 <asp:ListItem>car_wash</asp:ListItem>
                 <asp:ListItem>casino</asp:ListItem>
                 <asp:ListItem>cemetery</asp:ListItem>
                 <asp:ListItem>church</asp:ListItem>
                 <asp:ListItem>city_hall</asp:ListItem>
                 <asp:ListItem>clothing_store</asp:ListItem>
                 <asp:ListItem>convenience_store</asp:ListItem>
                 <asp:ListItem>courthouse</asp:ListItem>
                 <asp:ListItem>dentist</asp:ListItem>
                 <asp:ListItem>department_store</asp:ListItem>
                 <asp:ListItem>doctor</asp:ListItem>
                 <asp:ListItem>electrician</asp:ListItem>
                 <asp:ListItem>electronics_store</asp:ListItem>
                 <asp:ListItem>embassy</asp:ListItem>
                 <asp:ListItem>establishment</asp:ListItem>
                 <asp:ListItem>finance</asp:ListItem>
                 <asp:ListItem>fire_station</asp:ListItem>
                 <asp:ListItem>florist</asp:ListItem>
                 <asp:ListItem>food</asp:ListItem>
                 <asp:ListItem>funeral_home</asp:ListItem>
                 <asp:ListItem>furniture_store</asp:ListItem>
                 <asp:ListItem>gas_station</asp:ListItem>
                 <asp:ListItem>general_contractor</asp:ListItem>
                 <asp:ListItem>grocery_or_supermarket</asp:ListItem>
                 <asp:ListItem>gym</asp:ListItem>
                 <asp:ListItem>hair_care</asp:ListItem>
                 <asp:ListItem>hardware_store</asp:ListItem>
                 <asp:ListItem>health</asp:ListItem>
                 <asp:ListItem>hindu_temple</asp:ListItem>
                 <asp:ListItem>home_goods_store</asp:ListItem>
                 <asp:ListItem>hospital</asp:ListItem>
                 <asp:ListItem>insurance_agency</asp:ListItem>
                 <asp:ListItem>jewelry_store</asp:ListItem>
                 <asp:ListItem>laundry</asp:ListItem>
                 <asp:ListItem>lawyer</asp:ListItem>
                 <asp:ListItem>library</asp:ListItem>
                 <asp:ListItem>liquor_store</asp:ListItem>
                 <asp:ListItem>local_government_office</asp:ListItem>
                 <asp:ListItem>locksmith</asp:ListItem>
                 <asp:ListItem>lodging</asp:ListItem>
                 <asp:ListItem>meal_delivery</asp:ListItem>
                 <asp:ListItem>meal_takeaway</asp:ListItem>
                 <asp:ListItem>mosque</asp:ListItem>
                 <asp:ListItem>movie_rental</asp:ListItem>
                 <asp:ListItem>movie_theater</asp:ListItem>
                 <asp:ListItem>moving_company</asp:ListItem>
                 <asp:ListItem>museum</asp:ListItem>
                 <asp:ListItem>night_club</asp:ListItem>
                 <asp:ListItem>painter</asp:ListItem>
                 <asp:ListItem>park</asp:ListItem>
                 <asp:ListItem>parking</asp:ListItem>
                 <asp:ListItem>pet_store</asp:ListItem>
                 <asp:ListItem>pharmacy</asp:ListItem>
                 <asp:ListItem>physiotherapist</asp:ListItem>
                 <asp:ListItem>place_of_worship</asp:ListItem>
                 <asp:ListItem>plumber</asp:ListItem>
                 <asp:ListItem>police</asp:ListItem>
                 <asp:ListItem>post_office</asp:ListItem>
                 <asp:ListItem>real_estate_agency</asp:ListItem>
                 <asp:ListItem>restaurant</asp:ListItem>
                 <asp:ListItem>roofing_contractor</asp:ListItem>
                 <asp:ListItem>rv_park</asp:ListItem>
                 <asp:ListItem>school</asp:ListItem>
                 <asp:ListItem>shoe_store</asp:ListItem>
                 <asp:ListItem>shopping_mall</asp:ListItem>
                 <asp:ListItem>spa</asp:ListItem>
                 <asp:ListItem>stadium</asp:ListItem>
                 <asp:ListItem>storage</asp:ListItem>
                 <asp:ListItem>store</asp:ListItem>
                 <asp:ListItem>subway_station</asp:ListItem>
                 <asp:ListItem>synagogue</asp:ListItem>
                 <asp:ListItem>taxi_stand</asp:ListItem>
                 <asp:ListItem>train_station</asp:ListItem>
                 <asp:ListItem>travel_agency</asp:ListItem>
                 <asp:ListItem>university</asp:ListItem>
                 <asp:ListItem>veterinary_care</asp:ListItem>
                 <asp:ListItem>zoo</asp:ListItem>
             </asp:DropDownList>
         </div>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </div>
   

</asp:Content>
