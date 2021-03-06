<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="shortcut icon" href="#">
		<title>Insert title here</title>
	</head>
<body>

	<script>
/* 	Objects
	one of the JavaScript's data types
	a collection of related data and/or functionality
	Nearly all objects in JavaScript are instances of Object
	object = { key : value }; */
	
		//1. Literals and properties
		const name='ellie';
		const age = 4;
		/*		print(name, age);
 		funtcion print(name, age){
			console.log(name);
			console.log(age);
		} */
		function print(person){
			console.log(person.name);
			console.log(person.age);
		}
		const ellie = { name: 'ellie', age: 4};
		print(ellie);
		
		const obj1 = {}; 		   //'object literal' syntax
		const obj2 = new Object(); //'object constructor' syntax
		
		//dynamically typed language 동적으로 runtime 때 타입이 결정되는 언어
		ellie.hasJob = true; 
		console.log(ellie.hasJob);
		
		delete ellie.hasJob;
		console.log(ellie.hasJob);
		
		//2. Computed properties
		//key should be always string ''
		console.log(ellie.name);	//코딩하는 순간 그 key에 해당하는 값을 받아오고 싶을 때  
		console.log(ellie['name']); //정확하게 어떤 key가 필요한 지 모를 때 
		ellie['hasJob'] = true;
		console.log(ellie.hasJob);
		
		function printValue(obj, key){
			//console.log(obj.key); key를 모르기 때문에 undefined
			console.log(obj[key]);
			//동적으로 key의 value를 받아와야 할 때 computed properties 사용 
		}
		printValue(ellie, 'name');
		printValue(ellie, 'age');
		
		//3. Property value shorthand
		const person1 = { name: 'bob', age: 2 };
		const person2 = { name: 'steve', age: 3 };
		const person3 = { name: 'dave', age: 4 };
		//const person4 = makePerson('ellie', 30);
		const person4 = new Person('ellie', 30);
		console.log(person4);
		
		//4. Constructor function 
		//다른 계산을 하지 않고 순수하게 object를 생성하는 함수들은 보통 대문자로 시작 
		function Person(name, age){
			/*return {
				// name: name ,age: age 
				//자바스크립트는 property value shorthand라는 기능이 있어서 key와 value의 이름이 동일하다면 생략 가능
				name, age
			};*/
			//this = {};
			this.name = name;
			this.age = age;
			//return this;
		}

		//5. in operator: property existence check (key in obj)
		//해당하는 오브젝트 안에 키가 있는 지 없는 지 확인
		console.log('name' in ellie);
		console.log('age' in ellie);
		console.log('random' in ellie); //false 
		console.log(ellie.random);		//undefined
		
		//6. for..in vs for..of
		//for(key in obj) 모든 key들을 받아와서 일을 처리하고 싶을 때 
		for(key in ellie){
			console.log(key);
		}	
		
		//for(value of iterable) 배열과 같은 순차적으로 iterable한 애한테 씀 
		const array = [1, 2, 4, 5];
		for(let i=0; i<array.length; i++){
			console.log(array[i]);
		}
		//위와 똑같이 나옴 
		for(value of array){
			console.log(value);
		}
		
		console.clear();
		//7. Fun cloning
		//Object.assign(dest, [obj1, obj2, obj3...])
		const user = { name: 'ellie', age: '20'};
		const user2 = user;
		user2.name = 'coder';
		console.log(user);
		//user2에 user를 담으면서 둘이 같은 ref를 갖게되어 갖은 오브젝트를 가리킴
		//user2에서 name을 변경하면 user의 이름도 변경됨 => 같은 오브젝트를 가리키고 있으니까 당연히!
		
		//old way
		const user3 = {};
		//키를 돌리면서 복사 name, age
		for(key in user){
			user3[key] = user[key];
		}
		console.log(user3); 
		
		//const user4 = {};
		//Object.assign(user4, user);
		const user4 = Object.assign({}, user);
		console.log(user4);
		
		//another example
		const fruit1 = { color: 'red' };
		const fruit2 = { color: 'blue', size: 'big' };
		const mixed = Object.assign({}, fruit1, fruit2);
		console.log(mixed.color); //뒤에 나오는 애가 덮어씌움
		console.log(mixed.size);
		
		
	</script>

</body>
</html>