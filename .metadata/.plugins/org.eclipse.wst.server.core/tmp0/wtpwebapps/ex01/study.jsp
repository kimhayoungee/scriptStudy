<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
</head>
<body>

<script>
	var users = [
		 {id: 1, name: 'ID', age: 36}
		,{id: 2, name: 'BJ', age: 32}
		,{id: 3, name: 'JM', age: 32}
		,{id: 4, name: 'PJ', age: 27}
		,{id: 5, name: 'HA', age: 25}
		,{id: 6, name: 'JE', age: 26}
		,{id: 7, name: 'JI', age: 31}
		,{id: 8, name: 'MP', age: 23}
	];
	
/*	1. 명령형 코드 */
	//	1) 30세 이상인 users를 거른다. 
	var temp_users  = [];
	for(var i=0;i<users.length;i++){
		if(users[i].age >= 30){
			temp_users.push(users[i]);
		}
	}
//	console.log(temp_users);
	
	//	2) 30세 이상인 users의 names를 수집한다.
	var names = [];
	for(var i=0;i<temp_users.length;i++){
		names.push(temp_users[i].name);
	}
//	console.log(names);
	
	//	3)30세 미만인 users를 거른다.
	var temp_users  = [];
	for(var i=0;i<users.length;i++){
		if(users[i].age < 30){
			temp_users.push(users[i]);
		}
	}	
//	console.log(temp_users);
	
	//	4)30세 미만인 users의 ages를 수집한다.
	var ages = [];
	for(var i=0;i<temp_users.length;i++){
		ages.push(temp_users[i].age);
	}
//	console.log(ages);
	
	
/* 	2. _filter, _map으로 리팩토링 */
	function _filter(list, predi){
		var new_list = [];
		for(var i=0;i<list.length;i++){
			if(predi(list[i])){
				new_list.push(list[i]);
			}
		}
		
		return new_list;
	}
	
/*	    원래 있는 값을 직접 변경하지 않고 변형된 새로운 값을 리턴하는 방식으로 값을 변형해나가기 
	    필터와 같은 함수인 응용형 함수(응용형 프로그래밍, 적용형 프로그래밍)는 함수가 함수를 받아서 
	    원하는 시점에 해당하는 함수가 알고있는 인자를 적용하는 식으로 프로그래밍 하는 것 
	    필터함수를 고차함수라고도 함
	    고차함수는 함수를 인자로 받거나 함수를 리턴하거나 함수 안에서 인자로 받은 함수를 실행하는 함수	*/
	
//	console.log( _filter(users, function(user) { return user.age >= 30; }));
	
//	console.log( _filter(users, function(user) { return user.age < 30; }));	
	
	
//	console.log( _filter([1, 2, 3, 4], function(num) { return num % 2; }));
	
//	console.log( _filter([1, 2, 3, 4], function(num) { return !(num % 2); }));
	
	
	function _map(list, mapper){
		var new_list = [];
		for(var i=0;i<list.length;i++){
			new_list.push(mapper(list[i]));
		}
		return new_list;		
	}
	//다형성이 굉장히 높고 데이터가 어떻게 생겼는 지에 대해 알 수 없음
	//관심사가 완전히 분리되는 것
	
	var over_30 = _filter(users, function(user) { return user.age >= 30; });
//	console.log(over_30);
	
	var names = _map(over_30, function(user){
		return user.name;
	});
	console.log(names);
	
	var under_30 = _filter(users, function(user) { return user.age < 30; });
//	console.log(under_30);
	
	var ages = _map(under_30, function(user){
		return user.age;
	});
	
	console.log(ages);
	
	console.log(_map([1, 2, 3], function(num) { return num * 2; }));
	
/*	함수형 프로그래밍에서는 대입문을 많이 사용하지 않는 경향이 있다.
	원래 값을 만들어놓고 문장을 내려가면서 변형해나가는 것이 아니라
	함수를 통과해나가면서 한번에 값을 새롭게 만들어 나가는 식으로 프로그래밍  */
	
	console.log(
		_map(
			_filter(users, function(user) { return user.age >= 30; }),
			function(user){ return user.name; }));
	
	console.log(
		_map(
			_filter(users, function(user){ return user.age < 30; }),
			function(user) {return user.age; }));
	
	
</script>

</body>
</html>