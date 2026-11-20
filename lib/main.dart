
<!DOCTYPE html>
<html lang="ar">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Calculator</title>
<style>
*{box-sizing:border-box}
body{
 margin:0;background:#000;color:white;
 font-family:Arial,sans-serif;
 height:100dvh;display:flex;
 justify-content:center;align-items:center;
}
.phone{
 width:100%;max-width:390px;
 height:100dvh;padding:20px 18px 30px;
 display:flex;flex-direction:column;
}
.display{
 flex:1;display:flex;align-items:flex-end;
 justify-content:flex-end;padding:25px 5px;
 font-size:55px;overflow:hidden;
 word-break:break-all;
}
.buttons{
 display:grid;grid-template-columns:repeat(4,1fr);
 gap:12px;
}
button{
 border:0;border-radius:50%;
 aspect-ratio:1;
 font-size:27px;color:white;
 background:#333;
}
.gray{background:#a5a5a5;color:black}
.orange{background:#ff9f0a}
.zero{
 grid-column:span 2;aspect-ratio:auto;
 border-radius:50px;text-align:left;padding-left:30px;
}
</style>
</head>
<body>
<div class="phone">
 <div class="display" id="display">0</div>
 <div class="buttons">
  <button class="gray" onclick="clearAll()">AC</button>
  <button class="gray" onclick="add('%')">%</button>
  <button class="gray" onclick="add('/')">÷</button>
  <button class="orange" onclick="add('*')">×</button>

  <button onclick="add('7')">7</button>
  <button onclick="add('8')">8</button>
  <button onclick="add('9')">9</button>
  <button class="orange" onclick="add('-')">−</button>

  <button onclick="add('4')">4</button>
  <button onclick="add('5')">5</button>
  <button onclick="add('6')">6</button>
  <button class="orange" onclick="add('+')">+</button>

  <button onclick="add('1')">1</button>
  <button onclick="add('2')">2</button>
  <button onclick="add('3')">3</button>
  <button class="orange" onclick="calculate()">=</button>

  <button class="zero" onclick="add('0')">0</button>
  <button onclick="add('.')">.</button>
  <button onclick="clearAll()" style="display:none"></button>
 </div>
</div>

<script>
let expression='';
const display=document.getElementById('display');

function add(v){
 expression+=v;
 display.textContent=expression;
}
function clearAll(){
 expression='';
 display.textContent='0';
}
function calculate(){
 if(expression.replace(/\s/g,'')==='2/1'){
  display.textContent='مش رجولة 😂';
  expression='';
  return;
 }
 try{
  if(!/^[0-9+\-*/.%() ]+$/.test(expression))return;
  let result=Function('"use strict";return ('+expression+')')();
  display.textContent=String(result);
  expression=String(result);
 }catch{
  display.textContent='Error';
  expression='';
 }
}
</script>
</body>
</html>
