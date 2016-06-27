<%-- 
    Document   : final
    Created on : Apr 20, 2016, 2:26:47 AM
    Author     : kush
--%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.xml.parsers.*" %>
<%@ page import="org.w3c.dom.*" %>
<%@ page import="org.xml.sax.SAXException"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! String filePath1,filePath2,textArea1,textArea2,lala="love"; %>
<%!static String s,l,s2,s3; %>
<%! float value ;%>
<!DOCTYPE html>
<html>
    <head>
    <title> Online XML File Comparison Tool</title>
    <meta http-equiv="content-language" content="en-US">
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <link rel="stylesheet" href="http://codebeautify.org/css/formatter.css" type="text/css">
    <script src="common_load.js" type="text/javascript"></script>
    <script src="file_load.js" type="text/javascript"></script>
    <link rel="stylesheet" href="http://codebeautify.org/css/diffview.css" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  </head>
    <body id="cbBody">
    <!--    <div id="superdiv" class="superDiv"></div>-->
    <script src="http://codebeautify.org/js/difflib.js" type="text/javascript"></script>
    <script src="http://codebeautify.org/js/diffview.js" type="text/javascript"></script>
    <div id="innerBody" class="innerBody setBgImage">
      <div class="container-fluid viewerInnerBodyDiv">
        <div class="row-fluid">
          <div class="center">
            <div class="span12 fileDiffMainContainer">
              <h1 class="fileViewHead">XML Matcher</h1>
              <form>
                <!--         <form method="post" action="FileCompareServlet" enctype="multipart/form-data" name="filediff">-->
                <script>
                  function clearContent(e1,e2){
                    e1.value = '';
                    e2.value = '';
                    document.getElementById("disp_match").value='';
                  }
                </script>
                <div class="span6 original margin0">
                  <h4 align="center">Choose Your file#1</h4>
                  <div id="file1Div">
                    <input id="file1" name="file1" type="file" onchange="onChange1()"/>
                    <textarea name="myTextArea1" class="span12 allNumberConverter" id="textArea1"></textarea>
                    <script type="text/javascript">
                      //METHOD#4
                      function onChange1(){
                        //filePath1 = document.getElementById('file1').value;
                        //alert(filepath.toString());
                         filePath1 = document.getElementById("file1").files[0];
                        var reader = new FileReader();
                        reader.onload = function (e) {
                          
                          textArea1 = document.getElementById("textArea1");
                          textArea1.value=" ";
                          textArea1.value = e.target.result;
                        };
                        reader.readAsText(file1);
                      }
                    </script>
                  </div>
                  <input type="button" id="clear1" class="window_label" value="Reset" onclick="clearContent(file1,textArea1)">
                </div>

                <div class="span6 changed">
                  <h4 align="center">Choose Your file#2</h4>
                  <div id="file2Div" class="fd-zone">
                    <input id="file2" name="file2" type="file" onchange="onChange2()"/>
                    <textarea name="myTextArea2" class="span12 allNumberConverter" id="textArea2"></textarea>
                    <script type="text/javascript">
                      function onChange2(){
                       
                        //var filepath = document.getElementById('file2').value; 
                        //  alert(filepath.toString());
                         filePath2 = document.getElementById("file2").files[0];
                        var reader = new FileReader();
                        reader.onload = function (e) {
                          
                          var textArea2 = document.getElementById("textArea2");
                          
                          textArea2.value= e.target.result;
                        };
                        reader.readAsText(file2);
                      }
                    </script>
                  </div>
                  <input type="button" id="clear2" class="window_label" value="Reset" onclick="clearContent(file2,textArea2)" onchange="onChange1()" >
                </div>
                <div class="custombtn">
                 <button name="data" onclick="return onSecondLoad()">Difference</button>
                  <div class="option">
                      <%
                 
    File file = new File(filePath1);
    DocumentBuilder dBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
    Document doc = dBuilder.parse(file);
    //System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
    //System.out.println(doc.getChildNodes());
    if (doc.hasChildNodes()) {
      s="";
      printNote(doc.getChildNodes());
      //System.out.println("name is:"+s);	
      s2 = s;
    }
//    BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
//    System.out.println("Name of the file to be matched");
//    String s1 = br.readLine();
    File file1 = new File(filePath2);
    DocumentBuilder dBuilder1 = DocumentBuilderFactory.newInstance().newDocumentBuilder();
    Document doc1 = dBuilder1.parse(file1);
    //System.out.println("Root element :" + doc1.getDocumentElement().getNodeName());
    if (doc1.hasChildNodes()) {
      s = "";
      printNote(doc1.getChildNodes());
      //System.out.println("name is:"+s);
      s3 = s;
    }
    float x = 0;
       x =s2.length();
    String str = lcs(s2, s3);
    float n = str.length();
    float y = 100 * n / x;
     value=y;
   // System.out.println("matched length is:" + n);
    //System.out.println("main string lenght:" + x);
    //System.out.println("% matched:" + y);
    //System.out.println(s2);
     x=0;
    //System.out.println("matched substring is:" + str);
     
      
    } 
  %>
  
 <% 
  static HashMap<Integer, String> h = new HashMap<Integer, String>();
  int i = 0;
%>
                      <%
 void printNote(NodeList childNodes) {
    for (int i = 0; i < childNodes.getLength(); i++) {
      Node tempNode1 = childNodes.item(i);
      //System.out.println(childNodes.getLength());
      if (!tempNode1.getNodeName().equalsIgnoreCase("#text")) {
        //System.out.println("Node name is " + tempNode1.getNodeName());
      }
      if (tempNode1.hasChildNodes()) {
        int j;
        for (j = 0; j < tempNode1.getChildNodes().getLength(); j++) {
          Node node = tempNode1.getChildNodes().item(j);
          if (node.getNodeType() == Node.ELEMENT_NODE) {
            //System.out.println("node name: " + node.getNodeName());
            break;
          }
       }
        if (j < tempNode1.getChildNodes().getLength()) {
          printNote(tempNode1.getChildNodes());
          s = s.concat(tempNode1.getNodeName());
          //System.out.println("name is:"+s);
          //s="";

        } else {
          h.put(i, s);
          i++;
          s = s.concat(tempNode1.getNodeName());
          //System.out.println("name is:"+s);
        }
      }
    }
  }
  %>
  <% String lcs(String str1, String str2) {
    int l1 = str1.length();
    int l2 = str2.length();
    int[][] arr = new int[l1 + 1][l2 + 1];
    int len = 0, pos = -1;

    for (int x = 1; x < l1 + 1; x++) {
      for (int y = 1; y < l2 + 1; y++) {
        if (str1.charAt(x - 1) == str2.charAt(y - 1)) {
          arr[x][y] = arr[x - 1][y - 1] + 1;
          if (arr[x][y] > len) {
            len = arr[x][y];
            pos = x;
          }
        } else {
          arr[x][y] = 0;
        }
      }
    }
    return str1.substring(pos - len, pos);
  }
  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
  /**
   * Handles the HTTP
   * <code>GET</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    try {
             //  System.out.println();
    } catch (Exception ex) {
      Logger.getLogger(FileCompareServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
  }

  /**
   * Handles the HTTP
   * <code>POST</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    try {
       // System.out.println();

    } catch (Exception ex) {
      Logger.getLogger(FileCompareServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
  }

  /**
   * Returns a short description of the servlet.
   *
   * @return a String containing servlet description
   */
  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>
}


                        %>    
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                    <script type="text/javascript">
       
                      function onSecondLoad(){
                         var reader = new FileReader();
                          
                          document.getElementById("textArea1").value = "kush";
                    
                        
                      }
                      
                    </script>
                    
                    
                    
                    
                    
                    <p><label> Percentage match :</label>
                     
                      <text name="myText" value ="23203 ">
                      <%=value%>
                      </text>
                      
                    </p>

                  </div>
                </div>  
              </form>
              <script type="text/javascript">
                alert(lala);
               
              </script>
            </div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>
