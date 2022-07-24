
#ifndef OS_PROJEKAT_LIST_HPP
#define OS_PROJEKAT_LIST_HPP

template<typename T>
class List
{
private:
    struct Elem{
        T* data;
        Elem *next;

        Elem(T *data, Elem *next) : data(data), next(next) {}
    };

    Elem *head, *tail, *current;

public:
    List() : head(0), tail(0), current(0) {}

    List(const List<T> &) = delete;

    List<T> &operator=(const List<T> &) = delete;

    void addFirst(T *data){
        Elem *elem = new Elem(data, head);
        head = elem;
        if (!tail) { tail = head; }
    }

    void addLast(T *data){
        Elem *elem = new Elem(data, 0);
        if (tail){
            tail->next = elem;
            tail = elem;
        } else
            head = tail = elem;
    }

    T *removeFirst(){
        if (!head)
            return 0;

        Elem *elem = head;
        head = head->next;
        if (!head)
            tail = 0;

        T *ret = elem->data;
        delete elem;
        return ret;
    }

    T* peekFirst(){
        if (!head)
            return 0;
        return head->data;
    }

    T* removeLast(){
        if (!head)
            return 0;

        Elem *prev = 0;
        for (Elem *curr = head; curr && curr != tail; curr = curr->next)
            prev = curr;


        Elem *elem = tail;
        if (prev)
            prev->next = 0;
        else
            head = 0;
        tail = prev;

        T *ret = elem->data;
        delete elem;
        return ret;
    }

    T* peekLast(){
        if (!tail)
            return 0;
        return tail->data;
    }

    void resetCurrent(){
        current = head;
    }

    void moveCurrent(){
        if(current)
            current = current->next;

    }

    T* getCurrent(){
        if(!current)
            return 0;
        return current->data;
    }

    void insertAtPosition(T* elem, int pos){
        if(!pos){
            addFirst(elem);
            return;
        }
        resetCurrent();
        for(int i = 0;i < pos - 1;i++) moveCurrent();
        current->next = new Elem(elem, current->next);
    }
};

#endif //OS1_VEZBE07_RISCV_CONTEXT_SWITCH_1_SYNCHRONOUS_LIST_HPP
