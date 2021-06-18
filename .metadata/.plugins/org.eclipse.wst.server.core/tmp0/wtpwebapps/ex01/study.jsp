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
	
/*	1. ������ �ڵ� */
	//	1) 30�� �̻��� users�� �Ÿ���. 
	var temp_users  = [];
	for(var i=0;i<users.length;i++){
		if(users[i].age >= 30){
			temp_users.push(users[i]);
		}
	}
//	console.log(temp_users);
	
	//	2) 30�� �̻��� users�� names�� �����Ѵ�.
	var names = [];
	for(var i=0;i<temp_users.length;i++){
		names.push(temp_users[i].name);
	}
//	console.log(names);
	
	//	3)30�� �̸��� users�� �Ÿ���.
	var temp_users  = [];
	for(var i=0;i<users.length;i++){
		if(users[i].age < 30){
			temp_users.push(users[i]);
		}
	}	
//	console.log(temp_users);
	
	//	4)30�� �̸��� users�� ages�� �����Ѵ�.
	var ages = [];
	for(var i=0;i<temp_users.length;i++){
		ages.push(temp_users[i].age);
	}
//	console.log(ages);
	
	
/* 	2. _filter, _map���� �����丵 */
	function _filter(list, predi){
		var new_list = [];
		for(var i=0;i<list.length;i++){
			if(predi(list[i])){
				new_list.push(list[i]);
			}
		}
		
		return new_list;
	}
	
/*	    ���� �ִ� ���� ���� �������� �ʰ� ������ ���ο� ���� �����ϴ� ������� ���� �����س����� 
	    ���Ϳ� ���� �Լ��� ������ �Լ�(������ ���α׷���, ������ ���α׷���)�� �Լ��� �Լ��� �޾Ƽ� 
	    ���ϴ� ������ �ش��ϴ� �Լ��� �˰��ִ� ���ڸ� �����ϴ� ������ ���α׷��� �ϴ� �� 
	    �����Լ��� �����Լ������ ��
	    �����Լ��� �Լ��� ���ڷ� �ްų� �Լ��� �����ϰų� �Լ� �ȿ��� ���ڷ� ���� �Լ��� �����ϴ� �Լ�	*/
	
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
	//�������� ������ ���� �����Ͱ� ��� ����� ���� ���� �� �� ����
	//���ɻ簡 ������ �и��Ǵ� ��
	
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
	
/*	�Լ��� ���α׷��ֿ����� ���Թ��� ���� ������� �ʴ� ������ �ִ�.
	���� ���� �������� ������ �������鼭 �����س����� ���� �ƴ϶�
	�Լ��� ����س����鼭 �ѹ��� ���� ���Ӱ� ����� ������ ������ ���α׷���  */
	
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