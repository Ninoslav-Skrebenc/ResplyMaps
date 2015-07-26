using Newtonsoft.Json;
using Subgurim.Controles;
using Subgurim.Controles.GoogleChartIconMaker;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Windows.Devices.Geolocation; //<<<<----Operation is not supported on this platform.!!!!!




namespace RepslyMaps
{
    public class CurrentLocation
    {
        public double latitude;
        public double longitude;
    }
    
    public partial class _Default : Page 
    {
        static CurrentLocation cur = new CurrentLocation();
       
        protected void Page_Load(object sender, EventArgs e)
        {
         
            if (!IsPostBack)
            {

                StartApp();
                GetCurrentLocation();
            }
        }
        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
           
            GMap1.resetInfoWindows();
            GetCurrentLocation();
            GetPlaces();
           
           
        }

        //<<<----------------------GetCurrentLocation------------------->>>
        public void StartApp()
        {
            GMap1.enableHookMouseWheelToZoom = true;
        }
        public void GetCurrentLocation()
        {

            //check the browser type.
            System.Web.HttpBrowserCapabilities myBrowserCaps = Request.Browser;
            //If it`s  mobile Get location by GPS service.
            if (((System.Web.Configuration.HttpCapabilitiesBase)myBrowserCaps).IsMobileDevice)
            {
                Label1.Text = "Mobile 1";
           
            }
            else
            {
                // Full path to GeoLiteCity.dat file
                string FullDBPath = Server.MapPath("~/App_Data/GeoLiteCity.dat");
                // Visitor's IP address
                string VisitorIP = Request.ServerVariables["REMOTE_ADDR"];

                // Create objects needed for geo targeting
                Geotargeting.LookupService ls = new Geotargeting.LookupService(FullDBPath,
                Geotargeting.LookupService.GEOIP_STANDARD);
                Geotargeting.Location location = ls.getLocation(VisitorIP);

                //Check if object exsists 
                if (location != null)
                {
                    GLatLng latlng = new GLatLng(location.latitude, location.longitude);
                    GMap1.setCenter(latlng, 15);


                    string infoWindowHTML = string.Format(@"
                        <div style=""text-align:left"">
                            <b>GEOIP PROPERTIES</b><br/>
                            <b>Area Code</b>: {0}<br/>
                            <b>City</b>: {1}<br/>
                            <b>Country Code</b>: {2}<br/>
                            <b>Country Name</b>: {3}<br/>
                            <b>DMA Code</b>: {4}<br/>
                            <b>Postal Code</b>: {5}<br/>
                            <b>Region</b>: {6}
                        </div>",
                    location.area_code,
                    location.city,
                    location.countryCode,
                    location.countryName,
                    location.dma_code,
                    location.postalCode,
                    location.region);

                    GMap1.Add(new GInfoWindow(new GMarker(latlng), infoWindowHTML));
                    cur.latitude = location.latitude;
                    cur.longitude = location.longitude;
                }

                //if not place user in Zagreb
                else
                {
                    string infoWindowHTML = string.Format(@"
                        <div style=""text-align:left"">
                                    <p>We couldnt find your location,<br/>
                                    so we placed you in Zagreb.</p>
                        </div>");

                    GLatLng latlng = new GLatLng(45.8167, 15.9833);
                    GMap1.setCenter(latlng, 15);
                    GMap1.Add(new GInfoWindow(new GMarker(latlng), infoWindowHTML));
                    cur.latitude = 45.8167;
                    cur.longitude = 15.9833;
                }
            }
        }
        //<<<----------------------End of GetCurrentLocation------------------->>>


        //<<<----------------------GetPlaces------------------->>>
        public void GetPlaces()
        {
            //Get radius from textbox
            int rad;
            if (TextBoxRadius.Text != "Radius...")
            {
                rad = Convert.ToInt32(TextBoxRadius.Text);
            }
            else
            {
                rad = 1000;
            }
            //Construct request url
            Uri baseUri = new Uri("https://maps.googleapis.com/maps/api/place/nearbysearch/json");
            Uri myUri = new Uri(baseUri, "?location=" + cur.latitude + "," + cur.longitude + "&radius=" + rad + "&types="+DDPlaces.Text+"&key=AIzaSyCfqo3f5ycZhsj3CkSadqFCd4tbfIX6e-g");

            HttpWebRequest webRequest = WebRequest.Create(@""+myUri+"")
                as HttpWebRequest;
            webRequest.Timeout = 20000;
            webRequest.Method = "GET";

            //webRequest.BeginGetResponse(new AsyncCallback(RequestCompleted), webRequest);   //<----Probavao sam satima asinkrono :/

            //get response
            var response = webRequest.GetResponse();

              using (var stream = response.GetResponseStream())
           {
               var r = new StreamReader(stream);
               var resp = r.ReadToEnd();

               GooglePlacesResponse gpr = (GooglePlacesResponse)JsonConvert.DeserializeObject<GooglePlacesResponse>(resp);
               PinIcon p;
               GMarker gm;
               GInfoWindow win;
               foreach (var a in gpr.results)
               {
                   p = new PinIcon(PinIcons.info, Color.Yellow);
                   gm = new GMarker(new GLatLng(Convert.ToDouble(a.geometry.location.lat), Convert.ToDouble(a.geometry.location.lng)), new GMarkerOptions(new GIcon(p.ToString(), p.Shadow())));
                   win = new GInfoWindow(gm, a.name, false, GListener.Event.mouseover);
                   GMap1.Add(win);
                    
                    
               }
           }
        }

      
        //<<<----------------------End of GetPlaces------------------->>>


        /*//<<<----------------------AsyncCallback------------------->>>
        private void RequestCompleted(IAsyncResult result)
        {
            
            var request = (HttpWebRequest)result.AsyncState;
            var response = (HttpWebResponse)request.EndGetResponse(result);
            using (var stream = response.GetResponseStream())
            {
                var r = new StreamReader(stream);
                 var resp = r.ReadToEnd();

              
            }    
        }
        //<<<-------------------End of AsyncCallback------------->>>>*/

      
    }
}