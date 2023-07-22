//verify hours in co-directors page

Container( width:400, height:50, margin: EdgeInsets.all(10), child: ElevatedButton(onPressed: (){
if(type.contains('irect')){
FirebaseDatabase.instance.reference().child("AttendanceLog/" ).once().then((result){
var codelistfromfb = [];
var datecodelist = [];
print('Secusese');
print(result.key);
//print(result.value);
result.value.forEach(( key, value) {
//print(value);
//print(key);
delete.add(int.parse(key));
//todo put key in a list to know which ones to delete

//print(value['Info']);
//print(value['Info']['Date']);
codelistfromfb.add(value['Info']['Name']);
datecodelist.add(value['Info']['Date']);
});
codeList = codelistfromfb;
codeDate = datecodelist;

// refresh the UI - ListView based on the new data
setState(() {

});

}).catchError((e) {
print('failed');
print(e);
});};


},

child: Text('Verify Hours'),),),
Container(
height: (codeList.length*50)+5,
width: 400,
child: ListView.builder(
padding: const EdgeInsets.all(8),
itemCount: codeList.length,
itemBuilder: (BuildContext context, int index) {

return Container(




height: 50,
margin: EdgeInsets.only(top:5),

color: Colors.blue[700],
child:  Center(child: Row(
children: [

Text('Hours: '),

Text('2'+ " "),
Text('Date: '),
Container(

child: Text(codeDate[index].toString())),
Text(' Name: '),
Container(child: Text(codeList[index].toString())),
Container(child: ElevatedButton(onPressed: (){
FirebaseDatabase.instance.reference().child('tutors/'+codeList[index].toString()).once().then((value)
{
print(codeList[index].toString() );

hours = value.value['Hours'];
hours = hours+2;
print(hours);
}
);
Future.delayed(const Duration(milliseconds: 250),(){
FirebaseDatabase.instance.reference().child("tutors/"+ codeList[index].toString() ).update(
{


'Hours'  : hours,


}
).then((value) {
print(hours.toString() + "hours");
print(codeList[index].toString()+"final");
});
FirebaseDatabase.instance.reference().child("tutors/"+ codeList[index].toString() + '/logs' ).update(
{


codeDate[index].toString()  : 2,


}
).then((value) {
print(hours.toString() + "hours");
print(codeDate.toString());
print(codeList[index].toString()+"final");
});

});


// go back to Login screen
Future.delayed(const Duration(milliseconds: 400),(){
FirebaseDatabase.instance.reference().child('AttendanceLog/' + delete[index].toString()).remove().then((value){
delete.remove(delete[index]);

codeList.remove(codeList[index]);
//print(codeList);
setState(() {

});
});
});


//todo
//remove 1 from counter

//set up better numbering system

}, child: Text("Verify Hours")))

],
)),
);
}


),)