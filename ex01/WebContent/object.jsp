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
		
		//dynamically typed language �������� runtime �� Ÿ���� �����Ǵ� ���
		ellie.hasJob = true; 
		console.log(ellie.hasJob);
		
		delete ellie.hasJob;
		console.log(ellie.hasJob);
		
		//2. Computed properties
		//key should be always string ''
		console.log(ellie.name);	//�ڵ��ϴ� ���� �� key�� �ش��ϴ� ���� �޾ƿ��� ���� ��  
		console.log(ellie['name']); //��Ȯ�ϰ� � key�� �ʿ��� �� �� �� 
		ellie['hasJob'] = true;
		console.log(ellie.hasJob);
		
		function printValue(obj, key){
			//console.log(obj.key); key�� �𸣱� ������ undefined
			console.log(obj[key]);
			//�������� key�� value�� �޾ƿ;� �� �� computed properties ��� 
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
		//�ٸ� ����� ���� �ʰ� �����ϰ� object�� �����ϴ� �Լ����� ���� �빮�ڷ� ���� 
		function Person(name, age){
			/*return {
				// name: name ,age: age 
				//�ڹٽ�ũ��Ʈ�� property value shorthand��� ����� �־ key�� value�� �̸��� �����ϴٸ� ���� ����
				name, age
			};*/
			//this = {};
			this.name = name;
			this.age = age;
			//return this;
		}

		//5. in operator: property existence check (key in obj)
		//�ش��ϴ� ������Ʈ �ȿ� Ű�� �ִ� �� ���� �� Ȯ��
		console.log('name' in ellie);
		console.log('age' in ellie);
		console.log('random' in ellie); //false 
		console.log(ellie.random);		//undefined
		
		//6. for..in vs for..of
		//for(key in obj) ��� key���� �޾ƿͼ� ���� ó���ϰ� ���� �� 
		for(key in ellie){
			console.log(key);
		}	
		
		//for(value of iterable) �迭�� ���� ���������� iterable�� ������ �� 
		const array = [1, 2, 4, 5];
		for(let i=0; i<array.length; i++){
			console.log(array[i]);
		}
		//���� �Ȱ��� ���� 
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
		//user2�� user�� �����鼭 ���� ���� ref�� ���ԵǾ� ���� ������Ʈ�� ����Ŵ
		//user2���� name�� �����ϸ� user�� �̸��� ����� => ���� ������Ʈ�� ����Ű�� �����ϱ� �翬��!
		
		//old way
		const user3 = {};
		//Ű�� �����鼭 ���� name, age
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
		console.log(mixed.color); //�ڿ� ������ �ְ� �����
		console.log(mixed.size);
		
		
	</script>

</body>
</html>