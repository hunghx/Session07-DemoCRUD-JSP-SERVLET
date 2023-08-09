package ra.democrud;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "TaskServlet", value = "/TaskServlet")
public class TaskServlet extends HttpServlet {
    protected List<Task> tasks ;

    @Override
    public void init() throws ServletException {
        tasks = new ArrayList<>();
        tasks.add(new Task(1,"đi học",false));
        tasks.add(new Task(2,"đi ngủ",false));
        tasks.add(new Task(3,"làm bài tập",true));

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action !=null){
            switch (action){
                case "GETALL":
                    request.setAttribute("tasks",tasks);
                    request.getRequestDispatcher("/listTask.jsp").forward(request,response);
                    break;
                case "ADD":
                    request.getRequestDispatcher("/addTask.jsp").forward(request,response);
                    break;
                case "DELETE":
                    int id = Integer.parseInt(request.getParameter("id"));
                    tasks.remove(findById(id));
                    response.sendRedirect(request.getContextPath()+"/");
                    break;
                case "EDIT":
                    // tìm ra công việc với tham số id gửi lên Task 
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action !=null){
            switch (action){
                case "ADD":
                    // thêm mới
                    int id = getNewId();
                    String content = request.getParameter("content");
                    Task newTask = new Task(id,content,false);
                    tasks.add(newTask);
                    response.sendRedirect(request.getContextPath()+"/");
                    break;
            }
        }
    }
    protected int getNewId(){
        int maxId=0;
        for (Task t:tasks) {
            if(maxId<t.getId()){
                maxId = t.getId();
            }
        }
        return maxId+1;
    }
    protected Task findById(int id){
        for (Task t:tasks
             ) {
            if(t.getId() == id){
                return t;
            }
        }
        return null;
    }
}