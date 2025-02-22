/// 
/// 

mod task {

    pub struct Task {
        title: String,
        description: String,
        owner: String
        id: u32,
        completed: bool
    }

    impl Task {
        pub fn add(&mut self, title: String, description: String, owner: String, id: u32, completed: bool) {
            self.title = title;
            self.description = description;
            self.owner = owner;
            self.id = id;
            self.completed = completed;
        } 

        //Accessors

        pub fn getTitle(&mut self) -> &String {
            return self.title;
        }

        pub fn getDescription(&mut self) -> &String {
            return self.description;
        }

        pub fn getOwner(&mut self) -> &String {
            return self.owner;
        }

        pub fn getID(&mut self) -> &u32 {
            return self.id;
        }

        pub fn getCompleted(&mut self) -> &bool {
            return self.completed;
        }

        //Mutators

        pub fn setTitle(&mut self, title: String) {
            self.title = title;
        }

        pub fn setDescription(&mut self, description: String) {
            self.description = description;
        }

        pub fn setOwner(&mut self, owner: String) {
            self.owner = owner;
        }

        pub fn setID(&mut self, id: u32) {
            self.id = id;
        }

        pub fn setCompleted(&mut self, completed: bool) {
            self.completed = completed
        }

        pub fn toString(&mut self) -> &String {
            return "Task \n"
            + "Title: " + self.title + "\n"
            + "Description: " + self.description + "\n"
            + "Owner: " + self.owner + "\n"
            + "ID: " + self.id + "\n"
            + "Completed: " + self.c + "\n"
        }
    }
}