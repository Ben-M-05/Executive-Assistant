/// Represents a user-generated to-do task
///
/// Created: 2/20/25
///

pub struct Task {
    title: String,
    description: String,
    owner: String,
    id: u32,
    completed: bool,
}

impl Task {
    pub fn new(title: &str, description: &str, owner: &str, id: u32, completed: bool) -> Self {
        Task {
            title: String::from(title),
            description: String::from(description),
            owner: String::from(owner),
            id: id,
            completed: completed,
        }
    }

    //Accessors

    pub fn get_title(&mut self) -> &String {
        return &self.title;
    }

    pub fn get_description(&mut self) -> &String {
        return &self.description;
    }

    pub fn get_owner(&self) -> &String {
        return &self.owner;
    }

    pub fn get_id(&mut self) -> u32 {
        return self.id;
    }

    pub fn get_completed(&mut self) -> bool {
        return self.completed;
    }

    //Mutators

    pub fn set_title(&mut self, title: &str) {
        self.title = String::from(title);
    }

    pub fn set_description(&mut self, description: &str) {
        self.description = String::from(description);
    }

    pub fn set_owner(&mut self, owner: &str) {
        self.owner = String::from(owner);
    }

    pub fn set_id(&mut self, id: u32) {
        self.id = id;
    }

    pub fn set_completed(&mut self, completed: bool) {
        self.completed = completed
    }

    pub fn to_string(&mut self) -> String {
        return "Task \n".to_owned()
            + "Title: "
            + &self.title
            + "\n"
            + "Description: "
            + &self.description
            + "\n"
            + "Owner: "
            + &self.owner
            + "\n"
            + "ID: "
            + &self.id.to_string()
            + "\n"
            + "Completed: "
            + &self.completed.to_string()
            + "\n";
    }
}
