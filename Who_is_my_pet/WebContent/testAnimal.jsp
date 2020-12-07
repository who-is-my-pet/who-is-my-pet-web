<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error/error.jsp"%>
<%@ page import="user_has_animal.UserAnimalDTO"%>
<%@ page import="user_has_animal.UserAnimalDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/testAnimal.css">
<!--Load the AJAX API-->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
</head>

<body>
	<div style="text-align: center; font-size: 40px; margin-top: 40px">나와
		닮은 동물상 찾기</div>
	<!--모델 업로드 버튼-->
	<div style="margin-top: 40px; margin-bottom: 20px"></div>
	<!--여기에 html 추가-->
	<script class="jsbin"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<div class="file-upload">
		<button class="file-upload-btn" type="button"
			onclick="$('.file-upload-input').trigger( 'click' )">이미지
			추가하기</button>

		<div class="image-upload-wrap">
			<input class="file-upload-input" type='file'
				onchange="readURL(this);" accept="image/*" />
			<div class="drag-text">
				<h3>나의 사진을 불러와 주세요</h3>
			</div>
		</div>
		<div class="file-upload-content">
			<img class="file-upload-image" id="face-image" src="#"
				alt="your image" />
			<div class="image-title-wrap">
				<button type="button" onclick="removeUpload()" class="remove-image">
					Remove <span class="image-title">Uploaded Image</span>
				</button>
			</div>
		</div>

	</div>
	<div id="label-container"></div>

	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
	<!--여기에 javascript 추가-->
	<script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {

                var reader = new FileReader();

                reader.onload = function (e) {
                    $('.image-upload-wrap').hide();

                    $('.file-upload-image').attr('src', e.target.result);
                    $('.file-upload-content').show();

                    $('.image-title').html(input.files[0].name);
                };

                reader.readAsDataURL(input.files[0]);
                init().then(function() {
                    console.log("hello");
                    predict();
                });

            } else {
                removeUpload();
            }
        }

        function removeUpload() {
            $('.file-upload-input').replaceWith($('.file-upload-input').clone());
            $('.file-upload-content').hide();
            $('.image-upload-wrap').show();
        }
        $('.image-upload-wrap').bind('dragover', function () {
            $('.image-upload-wrap').addClass('image-dropping');
        });
        $('.image-upload-wrap').bind('dragleave', function () {
            $('.image-upload-wrap').removeClass('image-dropping');
        });
    </script>
	<script type="text/javascript">
        // the link to your model provided by Teachable Machine export panel
        const URL = "https://teachablemachine.withgoogle.com/models/SIvIpcxO8/";

        let model, webcam, labelContainer, maxPredictions;
        var data;
        var chart;
        var animal_id;
        var percentage

        // Load the image model 
        async function init() {
            const modelURL = URL + "model.json";
            const metadataURL = URL + "metadata.json";

            // load the model and metadata
            model = await tmImage.load(modelURL, metadataURL);
            maxPredictions = model.getTotalClasses();

            // append elements to the DOM
            labelContainer = document.getElementById("label-container");

            for (let i = 0; i < maxPredictions; i++) { // and class labels
                labelContainer.appendChild(document.createElement("div"));
            }
        }

        async function predict() {
            // predict can take in an image, video or canvas html element
            var image = document.getElementById("face-image")
            const prediction = await model.predict(image, false);
            prediction.sort((a, b) => parseFloat(b.probability) - parseFloat(a.probability));
            for (let i = 0; i < maxPredictions; i++) {
                const classPrediction =
                    prediction[i].className + ": " + prediction[i].probability.toFixed(2);
                labelContainer.childNodes[i].innerHTML = classPrediction;
            }
            console.log(prediction[0].className);
            console.log(prediction[0].probability.toFixed(2));
            
            animal_id = prediction[0].className;
            percentage = (prediction[0].probability.toFixed(2))*100;
            
            console.log(animal_id);
            console.log(percentage);
            
            return [animal_id, percentage];
          } 

         // Load the Visualization API and the piechart package.
         google.charts.load('current', {'packages':['corechart']});

         // Set a callback to run when the Google Visualization API is loaded.
         setTimeout(() => {google.charts.setOnLoadCallback(drawChart)},10000);


         // Callback that creates and populates a data table,
         // instantiates the pie chart, passes in the data and
         // draws it.
        function drawChart() {
             var data = google.visualization.arrayToDataTable([
                 ['className', 'probability', { role: 'style' }],
                 ['강아지상', 80.00, 'color: #FF0000'],
                 ['고양이상', 10.00, 'color: #01A9DB'],
                 ['토끼상', 10.00, 'color: #01A9DB'],
                 ['공룡상', 0, 'color: #088A4B'],
                 ['여우상', 0, 'color: #F4FA58'],
                 ['사슴상', 0, 'color: #FACC2E'],
                 ['말상', 0, 'color: #8A4B08'],

              ]);
             if(animal_id && percentage){
            	 console.log("if문 안");
                 console.log(animal_id);
                 console.log(percentage);
            	 data.addRows([
                     [predict()[0], predict()[1], 'color: #ACFA58'],
                     ['곰상', 0, 'color: #61380B'],
                     ['나무늘보상', 0, 'color: #3B0B0B']
                   ]);
            	 
             }
           // Set chart options
           var options = {'title':'',
                          'width':700,
                          'height':500, 'is3D':true, 
                          'backgroundColor':'#f9ece8',};

           // Instantiate and draw our chart, passing in some options.
           chart = new google.visualization.BarChart(document.getElementById('chart_div'));
           google.visualization.events.addListener(chart, 'select', selectHandler);
           chart.draw(data, options);
         }

        function selectHandler() {
           var selectedItem = chart.getSelection()[0];
           var value = data.getValue(selectedItem.row, 0);
           alert('The user selected ' + value);
         }


        function submitInfo(){
            var form = document.createElement("form");
            form.setAttribute("charset", "UTF-8");
            form.setAttribute("method", "Post");  //Post 방식
            form.setAttribute("action", "./testResultInfoAction.jsp"); //요청 보낼 주소

            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", "animal_id");
            hiddenField.setAttribute("value", animal_id);
            form.appendChild(hiddenField);

            document.body.appendChild(form);
            form.submit();
        }
    </script>
	<!--Div that will hold the pie chart-->
	<div style="width: 100%; text-align: center;">
		<div id="chart_div"
			style="width: 400; height: 300; display: inline-block;"></div>
	</div>
	<button type="button" onclick="submitInfo()">짝 찾기 페이지로 이동</button>
</body>
</html>
