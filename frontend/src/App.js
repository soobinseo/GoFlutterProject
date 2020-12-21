import React, {Component} from 'react';
import './App.css';
import Customer from './components/Customer'
import TableHead from "@material-ui/core/TableHead";
import TableBody from "@material-ui/core/TableBody";
import Table from "@material-ui/core/Table";
import TableRow from '@material-ui/core/TableRow';
import TableCell from '@material-ui/core/TableCell';



const customers = [
    {
        "name": "홍길동",
        "image": "http://placeimg.com/64/64/1",
        "id":1,
        "age":29,
        "job":"개발자",
        "gender":"남자"
    },
    {
        "name": "홍길동",
        "image": "http://placeimg.com/64/64/2",
        "id":1,
        "age":29,
        "job":"개발자",
        "gender":"남자"
    },
    {
        "name": "홍길동",
        "image": "http://placeimg.com/64/64/3",
        "id":1,
        "age":29,
        "job":"개발자",
        "gender":"남자"
    },

];

class App extends React.Component {
    render() {
        return (
            <div>
            <Table>
                <TableHead>

                </TableHead>
                <TableBody>
                    {customers.map(c => <Customer
                        id={c.id}
                        name={c.name}
                        image={c.image}
                        job={c.job}
                        gender={c.gender}
                        age={c.age}/>
                    )}
                </TableBody>
            </Table>
            </div>
        )
    }
}


export default App;
