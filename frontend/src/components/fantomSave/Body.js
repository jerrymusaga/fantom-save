import React, { useState, useEffect } from 'react';


export const Body = () => {

    const [record, setRecord] = useState({
        question1: { description: "", amount: 0, percent: 0 }
    });

    const addDescription = () => {
        // console.log(Math.random().toString());
        setRecord( {...record, "name": { description: "", amount: 0, percent: 0 }} )
        console.log(record);
        // setRecord( record.question4 = { description: "Something", amount: 4, percent: 24 } );
        // console.log(record);
    }

    return (
        <div className="body__container">

            <div className="body__navigation">
                <ul>
                    <li>Profile</li>
                    <li>Budget</li>
                </ul>
            </div>

            <div className="detailed__screen">
                <h3>Add To Budget</h3>
                <hr />

                <div className="budget__form">

                    <div>
                        <div>
                            <lable className="des__label">Description:</lable>
                            <input type="text" place="What for?" placeholder="Transportation" className="descrip" />
                        </div>
                        <span>$</span><input className="money__des" placeholder="9.99" />
                        <input  placeholder="24" className="money__per" /><span>%</span>
                    </div>

                    <button className="adder" onClick={ addDescription }>Add</button>

                </div>

                <button className="enter__btn">Enter</button>
            </div>

        </div>
    )
}