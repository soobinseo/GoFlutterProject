import React, {Component} from 'react';
import './App.css';
import Customer from './components/Customer'
import TableHead from "@material-ui/core/TableHead";
import TableBody from "@material-ui/core/TableBody";
import Table from "@material-ui/core/Table";
import TableRow from '@material-ui/core/TableRow';
import TableCell from '@material-ui/core/TableCell';





class App extends React.Component {

    state = {
        customers: ""
    };

    componentDidMount() {
        this.fetchData()
            .then(res => this.setState({customers: res}))
    }

    fetchData = async ()=> {
        const response = await fetch('/api/profile');
        console.log(response);
        const body = response.json();
        console.log(body);
        return body
    };

    render() {
        const {classes} = this.props;
        return (
            <div>
            <Table>
                <TableHead>

                </TableHead>
                <TableBody>
                    {this.state.customers ? this.state.customers.map(c =>

                        <Customer key={c.id}
                        id={c.id}
                        name={c.name}
                        image={c.image}
                        job={c.job}
                        gender={c.gender}
                        age={c.age}/>
                    ) : ""}
                </TableBody>
            </Table>
            </div>
        )
    }
}


export default App;
