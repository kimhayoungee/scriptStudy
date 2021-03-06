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
	
	var names = _map(over_30, function(user){ return user.name;	});
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
			function(user) { return user.age; }));
	
	function _each(list, iter){
		for(var i=0; i<list.length; i++){
			iter(list[i]);
		}
		return list;
	}
	
	function _map(list, mapper){
		var new_list = [];
		_each(list, function(val){
			new_list.push(mapper(val));
		});
		return new_list;
	}
	
/*	3. each 만들기  
		1) _each로 _map, _filter 중복 제거
		
		2) 외부 다형성
		   1. array_like, arguments, document.querySelectorAll
		      배열이 아니어도 돌릴수 있는 객체들은 모두 돌릴 수 있도록 
*/
	console.log(
		[1, 2, 3].map(function(val){
			return val * 2;
		})
	);

	console.log(
		[1, 2, 3, 4].map(function(val){
			return val * 2;
		})
	);		
	
	console.log(
		[1, 2, 3, 4].filter(function(val){
			return val % 2;
		})		
	);
	
/*	위의 map과 filter는 정확히 말하자면 함수가 아니라 메서드
	메서드는 객체지향 프로그래밍으로 객체의 상태에 따라 결과가 달라지는 특징을 가짐 
	메서드의 특징은 해당 클래스에 정의되기 때문에 
	해당 클래스의 인스턴스에서만 사용 가능  => map이라는 함수는 array가 아니면 사용할 수 없다는 뜻 
	따라서 객체지향은 다형성을 지원하기에 어려운 부분들이 있음 
	자바스크립트에는 array가 아닌데 array처럼 여겨지는 객체가 굉장히 많다. (예 jQuery 객체)
	jQuery객체는 $('div') 이런식으로 어떤 Element를 찾았을 때 리턴된 객체를 말함
	이 객체는 array가 아니고 arraylike 객체  */
	
//	console.log( document.querySelectorAll('*'));
	//[html, head, meta, title, body, script]
	//배열 같아 보이지만 배열(array) 아님  = map과 filter 메서드를 사용할 수 없다는 뜻
	
/*	console.log(
		document.querySelectorAll('*').map(function(node) {
			return node.nodeName;
		})		
	);  
	배열이 아니기 때문에 에러뜸 */
	
	console.log(
		_map(document.querySelectorAll('*'), function(node){
			return node.nodeName;
		})		
	);
/*	_map은 메서드가 아닌 함수, 배열이 아니어도 동작 
	우리가 만든 _map은 들어오는 인자가 length가 있고, 
	그것이 숫자여서 0부터 돌았을 때 해당하는 키마다 값이 있으면 사용이 가능   
	
	함수가 먼저 나오는 프로그래밍은 데이터가 있기 전부터 함수가 있게 되고
	데이터가 먼저 나오는 프로그래밍은 데이터가 있어야  메서드가 생긴다. 
	객체지향은 반드시 해당하는 객체가 생겨야 기능을 수행할 수 있기 때문에 평가의 순서가 굉장히  중요하다. 
	
	함수형은 함수가 혼자 먼저 존재하기 때문에 평가시점이 상대적으로 유연해진다. 
	이것을 이용해 더 높은 조합성을 만들어낼 수 있다. 
*/

/*		3) 내부 다형성 
			1. predi, iter, mapper 내부다형성은 이런 보조함수가 책임진다.
			해당하는 데이터에 대해서 살펴보는 것 없이 콜백 보조함수에 위임하기 때문에
			데이터형에 있어서 자유롭고 다형성을 높이는데 유리하다. */
			
	_map([1, 2, 3, 4], function(v){
		return v + 10;
	});
/*	함수형 프로그래밍에서는 두번째 함수를 콜백함수라고 하는 경향이 있음
	콜백함수는 무조건 어떤 일들을 다 수행한 다음에 다시 돌려주는 것을 뜻하는 함수
	predicate 어떤 조건을 리턴하는 함수
	iterator 돌면서 반복적으로 실행되는 함수
	mapper 무언가와 무언가 사이를 매핑하는 함수
	그냥 콜백함수라고 하기보다는 이렇게 각각의 역할에 맞는 보조함수의 이름으로 따로 불러주는 것이 좋다. 
*/	

/*  3. 커링 
	      함수와 인자를 다루는 기법 , 함수의 인자를 하나씩 적용해나가다가 필요한 인자가 모두 채워지면 함수 본체를 실행하는 기법 
	      
	   1) _curry, _curryr 
	   
	function _curry(fn){
		return function(a){
			return function(b){
				return fn(a, b);
		    }
	    }
    }*/
	//위의 코드로는 add(1, 2) 이렇게는 적용되지 않음, f(b){ return fn(a + b) }라고 함수가 리턴돼버림
	
	function _curry(fn){
		return function(a, b){
			return arguments.length == 2 ? fn(a, b) : function(b) { return fn(a, b); };
		}
	}
    //이렇게 수정하면 add(1, 2)도 제대로 실행됨 
    
	var add = _curry(function(a, b){
		return a + b;
	});
	//본체함수인 _curry 이하 부분을 갖고 있다가 원하는 시점까지 미뤄뒀다가 최종적으로 평가하는 기법 
	//계속해서 함수가 함수를 대신 실행하거나, 함수가 함수를 리턴하는 식으로 함수를 조합해나갈 수 있도록 만들어감 
	//함수에 인자를 하나만 적용하면 함수를 리턴하게 된다
	
/*	var add = function(a){
		return function(b){
			return fn(a, b);
		}
	}; */
	
	var add10 = add(10);
	var add5 = add(5);
	console.log( add10(5) );
	console.log( add(5)(3) );
	console.log( add5(3) );
	console.log( add(10)(3) );	
	console.log( add(1, 2) );
	
	
	var sub = _curryr(function(a, b){
		return a - b;
	});
	
	console.log( sub(10, 5) ); //10 - 5로 동작
	var sub10 = sub(10);     
	console.log( sub10(5) );   //_curry함수를 적용하면 10 - 5로 동작
	//sub에 _curry가 아닌 _curryr을 적용하면 5 - 10 으로 동작 
	
	//오른쪽부터 인자를 적용해나가는 커리 함수
    function _curryr(fn){
    	return function(a, b){
    		return arguments.length == 2 ? fn(a,b) : function(b) { return fn(b, a); };
    	}
    }
	
	/* 2) _get 만들어 좀 더 간단하게 하기 
	오브젝트에 있는 값을 안전하게 창조하는 함수
	
	function _get(obj, key){
		return obj == null ? undefined : obj[key];
	} */
	
	var _get = _curryr(function(obj, key){
		return obj == null ? undefined : obj[key];
	});
	
	var user1 = users[0];
	console.log(user1.name);
	console.log(_get(user1,'name'));
	console.log(_get('name')(user1));
	
	var get_name = _get('name');
	console.log( get_name(user1) );
	console.log( get_name(users[3]) );
	
	
	console.log(_map(_filter(users, function(user){return user.age>=30;}), _get('name')));
	//console.log(users[10].name);
	//console.log(_get(users[10], 'name'));
</script>

</body>
</html>