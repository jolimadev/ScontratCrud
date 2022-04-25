// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;


contract TaskCrud {
    
    struct Task {
        uint id;
        string name;
        string description;
    }
    
    Task[] tasks;
    uint nextId; // default value 0, add public to see the value//entero sin valor
    
    function createTask(string memory _name, string memory _description) public { //_memory convencion en solidity como _id
        tasks.push(Task(nextId, _name, _description));
        nextId++;
    }
    
    
    function findIndex(uint _id) internal view returns (uint) {
        for (uint i = 0; i < tasks.length; i++) {
            if (tasks[i].id == _id) {                
                return i;
            }
        }
        revert("Task not found");
    }
    
    function updateTask(uint _id, string memory _name, string memory _description) public {
        uint index =  findIndex(_id);
        tasks[index].name = _name;
        tasks[index].description = _description;
    }
    
    function readTask(uint _id) public view returns (uint, string memory, string memory) { //string memory significa que esos valroes van a estar dosponibles temporalmente para mostrar y despúes se eliminan//memoruy means that the values are gonna be deleted passed the time
        uint index = findIndex(_id);
        return (tasks[index].id, tasks[index].name, tasks[index].description);
    }
    
    function deleteTask(uint _id) public {
        uint index = findIndex(_id);
        delete tasks[index];
    }
    
}