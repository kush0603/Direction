
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
<%! String file1,file2,textArea1,textArea2; %>
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
              <form method="post" action="FileCompareServlet">
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
                        alert("ram ram");
                        //filePath1 = document.getElementById('file1').value;
                        //alert(filepath.toString());
                         file1 = document.getElementById("file1").files[0];
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
                         file2 = document.getElementById("file2").files[0];
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
                  <input id="diff" type="submit" value="Difference" onclick="onSecondLoad()" class="wtd span4">
                  <div class="option">
                    <script type="text/javascript">
       
                      function onSecondLoad(){
                         var reader = new FileReader();
                       
                          document.getElementById("textArea1").value = "kush ";
                        
                       // textArea1.value = e.target.result;
                       
                        //reader.readAsText(file1);
                         
                        
                      }
                    </script>
                    
                    
                    
                    
                    
                    <p><label> Percentage match :</label>
                      <% Object value = request.getAttribute("value");%>
                      //Object filecontent=request.getAttribute("filecontent");
                      
                      <!--<textarea name="styled-textarea" lass="styled" id="style_id" placeholder="0%">
                        
                      </textarea>-->
                      <text name="myText" value ="23203 ">
                      <%=value%>
                      </text>
                      
                    </p>

                  </div>
                </div>  
              </form>
              <script type="text/javascript">
                alert("yaha hu");
               // alert(file1);
                alert(<%=file1%>);
               
                //var x = document.myForm.myInput;
              </script>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!--    <script src="https://apis.google.com/js/platform.js" async="" defer="" gapi_processed="true"></script>
        <script type="text/javascript" src="http://codebeautify.org/js/footer.js"></script>
        <div id="openError" class="hide"> </div>
        <div id="loadUrlPathDiv" class="hide">
          <input type="text" id="path" class="urlPath" placeholder="Paste your url">
        </div>
    
    <input type="file" name="userfile" style="position: absolute; margin: -5px 0px 0px -175px; padding: 0px; width: 220px; height: 30px; font-size: 14px; opacity: 0; cursor: pointer; display: none; z-index: 2147483583; top: 155px; left: 512px;">
    <input type="file" name="userfile" style="position: absolute; margin: -5px 0px 0px -175px; padding: 0px; width: 220px; height: 30px; font-size: 14px; opacity: 0; cursor: pointer; display: none; z-index: 2147483583; top: 168px; left: 707px;">
    --> </body>
</html>