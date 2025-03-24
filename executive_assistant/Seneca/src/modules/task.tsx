
import {useState} from 'react';


/**
 * TodoComponent
 * 
 * @author Ben Maigur
 * 
 * @description A React component that represents a To-Do list item
 * 
 * @param title Name of the To-Do item
 * @param description A discription of the To-Do item
 * @param isCompleted Represents the completion status of the To-Do item
 * 
 */

interface TodoComponent {
    title: string,
    description: string,
}

export default function TodoComponent({title, description} : TodoComponent) {
    const [checked, setChecked] = useState(false);
    return (
        <div className=""> 
            <div className="title-wrapper">
                <h3 className="title">{title}</h3>
            </div>
            <div className="description-wrapper">
                <p className="text-red-500">{description}</p>
            </div>
            <div className="completion-wrapper">
                <input type="checkbox" checked={checked} onClick={() => setChecked(checked ? false : true)}/>
            </div>
        </div>
    )
}
