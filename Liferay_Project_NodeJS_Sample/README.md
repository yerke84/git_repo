1) Install nodejs, npm, eclipse & configure them (git, maven on eclipse)<br/>
2) Run eclipse<br/>
3) Create liferay project by maven & configure pom.xml & update project (Right click on project - Maven - Update project)<br/>
4) Create liferay portlet in the project & configure project (for example - remove default portlet)<br/>
5) Share this project into git (Right click on project - Team - Share Project)<br/>
6) Commit & Push project periodically<br/>
7) Create 'README.md' file in project root, if it needs (you may use it for instructions list, like this)<br/>
8) Add <b>/node_modules/</b> entry to <b>.gitignore</b> file<br/>
9) Right click folder '/src/main/webapp/js' &  select 'Show In - Terminal'<br/>
10) In terminal authorize as root<br/>
11) In terminal run command <b>npm install -g create-react-app</b><br/>
12) In terminal run command <b>exit</b> to log out for root<br/>
13) In terminal run command <b>create-react-app nodejs_dev</b> and wait a while<br/>
14) In terminal run command <b>cd nodejs_dev</b> to go to node js project folder<br/>
15) In terminal run command <b>npm install arui-feather --save-dev</b> to go to node js project folder<br/>
16) In eclipse open <b>/src/main/webapp/js/nodejs_dev/src/App.js</b> file for edit, here add your nodejs & reactJs code<br/>
17) In eclipse open <b>/src/main/webapp/js/nodejs_dev/src/index.js</b> file for edit, here change document Element Id to your own (default value is <b>root</b>), for example to unique GUID (https://guidgenerator.com/).
Do same with <b>src/main/webapp/js/nodejs_dev/public/index.html</b> file<br/> 
18) Return to terminal and run comman <b>npm start</b> to test code<br/>
19) Open address <b>http://localhost:3000/</b> and test a page<br/>
20) In terminal run command <b>Ctrl+C</b> to stop server<br>
21) In terminal run command <b>npm run build</b> to bundle the app into static files for production<br>
22) After building open <b>src/main/webapp/js/nodejs_dev/build/index.html</b> file, copy from there 'div' tag (sample <b>&lt;div id="abb0df2a-3855-4e57-a0a5-f1c68189ac0c"&gt;&lt;/div&gt;</b>) and paste it to portlet jsp file (in our case <b>src/main/webapp/html/mynodejs/view.jsp</b> file) after tag <b>&lt;portlet:defineObjects /&gt;</b><br/>